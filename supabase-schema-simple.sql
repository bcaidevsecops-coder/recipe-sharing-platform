-- SIMPLIFIED VERSION - Use this if the main schema has issues
-- This version uses simpler storage policies

-- ============================================================================
-- AVATAR STORAGE POLICIES (Simplified Version)
-- ============================================================================

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view avatars" ON storage.objects;
DROP POLICY IF EXISTS "Users can upload avatars" ON storage.objects;
DROP POLICY IF EXISTS "Users can update avatars" ON storage.objects;
DROP POLICY IF EXISTS "Users can delete avatars" ON storage.objects;

-- Policy: Anyone can view avatars (public read)
CREATE POLICY "Anyone can view avatars"
  ON storage.objects
  FOR SELECT
  USING (bucket_id = 'avatars');

-- Policy: Authenticated users can upload avatars (simplified - allows any authenticated user)
CREATE POLICY "Users can upload avatars"
  ON storage.objects
  FOR INSERT
  WITH CHECK (
    bucket_id = 'avatars' AND
    auth.role() = 'authenticated'
  );

-- Policy: Authenticated users can update avatars
CREATE POLICY "Users can update avatars"
  ON storage.objects
  FOR UPDATE
  USING (
    bucket_id = 'avatars' AND
    auth.role() = 'authenticated'
  );

-- Policy: Authenticated users can delete avatars
CREATE POLICY "Users can delete avatars"
  ON storage.objects
  FOR DELETE
  USING (
    bucket_id = 'avatars' AND
    auth.role() = 'authenticated'
  );

