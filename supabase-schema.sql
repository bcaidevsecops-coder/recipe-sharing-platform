-- Recipe Sharing Platform Database Schema
-- Run this SQL in your Supabase SQL Editor to set up the database
-- Go to: https://app.supabase.com/project/_/sql/new

-- ============================================================================
-- 1. CREATE PROFILES TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  username TEXT UNIQUE,
  full_name TEXT,
  avatar_url TEXT,
  bio TEXT,
  website TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- ============================================================================
-- 2. CREATE RECIPES TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS recipes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  ingredients TEXT[] NOT NULL,
  steps TEXT[] NOT NULL,
  image_url TEXT,
  category TEXT NOT NULL,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- ============================================================================
-- 3. CREATE INDEXES FOR PERFORMANCE
-- ============================================================================
-- Profile indexes
CREATE INDEX IF NOT EXISTS profiles_username_idx ON profiles(username);
CREATE INDEX IF NOT EXISTS profiles_created_at_idx ON profiles(created_at DESC);

-- Recipe indexes
-- Full-text search index on title
CREATE INDEX IF NOT EXISTS recipes_title_idx ON recipes USING gin(to_tsvector('english', title));

-- Category index for filtering
CREATE INDEX IF NOT EXISTS recipes_category_idx ON recipes(category);

-- User ID index for user-specific queries
CREATE INDEX IF NOT EXISTS recipes_user_id_idx ON recipes(user_id);

-- Created at index for sorting
CREATE INDEX IF NOT EXISTS recipes_created_at_idx ON recipes(created_at DESC);

-- ============================================================================
-- 4. ENABLE ROW LEVEL SECURITY (RLS)
-- ============================================================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;

-- ============================================================================
-- 5. CREATE ROW LEVEL SECURITY POLICIES FOR PROFILES
-- ============================================================================

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view profiles" ON profiles;
DROP POLICY IF EXISTS "Users can create their own profile" ON profiles;
DROP POLICY IF EXISTS "Users can update their own profile" ON profiles;
DROP POLICY IF EXISTS "Users can delete their own profile" ON profiles;

-- Policy: Anyone can view profiles (public read access)
CREATE POLICY "Anyone can view profiles"
  ON profiles
  FOR SELECT
  USING (true);

-- Policy: Users can insert their own profile
CREATE POLICY "Users can create their own profile"
  ON profiles
  FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Policy: Users can update their own profile
CREATE POLICY "Users can update their own profile"
  ON profiles
  FOR UPDATE
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- Policy: Users can delete their own profile
CREATE POLICY "Users can delete their own profile"
  ON profiles
  FOR DELETE
  USING (auth.uid() = id);

-- ============================================================================
-- 6. CREATE ROW LEVEL SECURITY POLICIES FOR RECIPES
-- ============================================================================

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view recipes" ON recipes;
DROP POLICY IF EXISTS "Authenticated users can create recipes" ON recipes;
DROP POLICY IF EXISTS "Users can update their own recipes" ON recipes;
DROP POLICY IF EXISTS "Users can delete their own recipes" ON recipes;

-- Policy: Anyone can view all recipes (public read access)
CREATE POLICY "Anyone can view recipes"
  ON recipes
  FOR SELECT
  USING (true);

-- Policy: Authenticated users can create recipes
CREATE POLICY "Authenticated users can create recipes"
  ON recipes
  FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

-- Policy: Users can update their own recipes
CREATE POLICY "Users can update their own recipes"
  ON recipes
  FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Policy: Users can delete their own recipes
CREATE POLICY "Users can delete their own recipes"
  ON recipes
  FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================================================
-- 7. CREATE STORAGE BUCKET FOR AVATARS
-- ============================================================================
INSERT INTO storage.buckets (id, name, public)
VALUES ('avatars', 'avatars', true)
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- 8. CREATE STORAGE POLICIES FOR AVATARS
-- ============================================================================

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view avatars" ON storage.objects;
DROP POLICY IF EXISTS "Users can upload their own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can update their own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can delete their own avatar" ON storage.objects;

-- Policy: Anyone can view avatars (public read)
CREATE POLICY "Anyone can view avatars"
  ON storage.objects
  FOR SELECT
  USING (bucket_id = 'avatars');

-- Policy: Authenticated users can upload their own avatars
-- Note: Path should be in format: avatars/{user_id}/filename
-- Using simpler path check that works across Supabase versions
CREATE POLICY "Users can upload their own avatar"
  ON storage.objects
  FOR INSERT
  WITH CHECK (
    bucket_id = 'avatars' AND
    auth.role() = 'authenticated' AND
    (name LIKE (auth.uid()::text || '/%') OR name LIKE ('avatars/' || auth.uid()::text || '/%'))
  );

-- Policy: Users can update their own avatars
CREATE POLICY "Users can update their own avatar"
  ON storage.objects
  FOR UPDATE
  USING (
    bucket_id = 'avatars' AND
    (name LIKE (auth.uid()::text || '/%') OR name LIKE ('avatars/' || auth.uid()::text || '/%'))
  );

-- Policy: Users can delete their own avatars
CREATE POLICY "Users can delete their own avatar"
  ON storage.objects
  FOR DELETE
  USING (
    bucket_id = 'avatars' AND
    (name LIKE (auth.uid()::text || '/%') OR name LIKE ('avatars/' || auth.uid()::text || '/%'))
  );

-- ============================================================================
-- 9. CREATE STORAGE BUCKET FOR RECIPE IMAGES
-- ============================================================================
INSERT INTO storage.buckets (id, name, public)
VALUES ('recipe-images', 'recipe-images', true)
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- 10. CREATE STORAGE POLICIES FOR RECIPE IMAGES
-- ============================================================================

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view recipe images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload recipe images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update recipe images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete recipe images" ON storage.objects;

-- Policy: Anyone can view recipe images (public read)
CREATE POLICY "Anyone can view recipe images"
  ON storage.objects
  FOR SELECT
  USING (bucket_id = 'recipe-images');

-- Policy: Authenticated users can upload recipe images
CREATE POLICY "Authenticated users can upload recipe images"
  ON storage.objects
  FOR INSERT
  WITH CHECK (
    bucket_id = 'recipe-images' AND
    auth.role() = 'authenticated'
  );

-- Policy: Authenticated users can update recipe images
CREATE POLICY "Authenticated users can update recipe images"
  ON storage.objects
  FOR UPDATE
  USING (
    bucket_id = 'recipe-images' AND
    auth.role() = 'authenticated'
  );

-- Policy: Authenticated users can delete recipe images
CREATE POLICY "Authenticated users can delete recipe images"
  ON storage.objects
  FOR DELETE
  USING (
    bucket_id = 'recipe-images' AND
    auth.role() = 'authenticated'
  );

-- ============================================================================
-- 11. CREATE FUNCTION TO AUTO-CREATE PROFILE ON USER SIGNUP
-- ============================================================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username, full_name)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)),
    COALESCE(NEW.raw_user_meta_data->>'full_name', '')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile when user signs up
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_new_user();

-- ============================================================================
-- 12. CREATE FUNCTION TO AUTO-UPDATE updated_at TIMESTAMP
-- ============================================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 13. CREATE TRIGGERS TO AUTO-UPDATE updated_at ON UPDATES
-- ============================================================================
DROP TRIGGER IF EXISTS update_profiles_updated_at ON profiles;
DROP TRIGGER IF EXISTS update_recipes_updated_at ON recipes;

CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_recipes_updated_at
  BEFORE UPDATE ON recipes
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- VERIFICATION QUERIES (Optional - run these to verify setup)
-- ============================================================================

-- Check if table exists and has correct structure
-- SELECT column_name, data_type, is_nullable 
-- FROM information_schema.columns 
-- WHERE table_name = 'recipes';

-- Check if RLS is enabled
-- SELECT tablename, rowsecurity 
-- FROM pg_tables 
-- WHERE tablename = 'recipes';

-- Check if storage bucket exists
-- SELECT * FROM storage.buckets WHERE id = 'recipe-images';

-- Check policies
-- SELECT * FROM pg_policies WHERE tablename = 'profiles';
-- SELECT * FROM pg_policies WHERE tablename = 'recipes';

-- Check if storage buckets exist
-- SELECT * FROM storage.buckets WHERE id IN ('avatars', 'recipe-images');
