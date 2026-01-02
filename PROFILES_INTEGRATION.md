# Profiles Integration

The profiles feature has been successfully integrated into the Recipe Sharing Platform. This document outlines what was added and how to use it.

## What Was Added

### 1. Database Schema (`supabase-schema.sql`)

- **Profiles Table**: Stores user profile information
  - `id` (UUID, references auth.users)
  - `username` (unique)
  - `full_name`
  - `avatar_url`
  - `bio`
  - `website`
  - `created_at` and `updated_at` timestamps

- **Storage Bucket**: `avatars` bucket for profile pictures
- **Auto-Profile Creation**: Trigger that automatically creates a profile when a user signs up
- **Row Level Security**: Policies for public viewing and user-specific updates

### 2. TypeScript Types (`types/database.ts`)

Added `Profile` and `ProfileUpdate` interfaces for type safety.

### 3. Profile Page (`app/profile/page.tsx`)

A dedicated page where users can view and edit their profile information.

### 4. Profile Form Component (`components/profile-form.tsx`)

A comprehensive form component that allows users to:
- Update username (must be unique)
- Set full name
- Write a bio
- Add website URL
- Upload/change avatar image

### 5. Updated Navbar (`components/navbar.tsx`)

- Displays user avatar (or initial letter if no avatar)
- Shows profile name/username
- Links to profile page
- Responsive design (hides name on small screens)

### 6. Updated Recipe Detail Page (`app/recipes/[id]/page.tsx`)

- Shows recipe author information
- Displays author avatar
- Shows author name/username

## Setup Instructions

### 1. Run the Updated SQL Schema

The `supabase-schema.sql` file has been updated with the profiles table. Run it in your Supabase SQL Editor:

1. Go to your Supabase dashboard
2. Navigate to **SQL Editor**
3. Click **New Query**
4. Copy the entire contents of `supabase-schema.sql`
5. Paste and run it

This will:
- Create the profiles table
- Set up RLS policies
- Create the avatars storage bucket
- Add the auto-profile-creation trigger

### 2. For Existing Users

If you already have users in your system, you'll need to create profiles for them. Run this SQL:

```sql
-- Create profiles for existing users
INSERT INTO public.profiles (id, username, full_name)
SELECT 
  id,
  split_part(email, '@', 1) as username,
  '' as full_name
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.profiles)
ON CONFLICT (id) DO NOTHING;
```

### 3. Verify Storage Bucket

After running the SQL:
1. Go to **Storage** in Supabase dashboard
2. Verify the `avatars` bucket exists
3. Make sure it's set to **Public**

## Features

### Profile Management

- **View Profile**: Navigate to `/profile` to see and edit your profile
- **Update Information**: Change username, full name, bio, and website
- **Avatar Upload**: Upload a profile picture (stored in Supabase Storage)
- **Auto-Creation**: Profiles are automatically created when users sign up

### Display Features

- **Navbar**: Shows user avatar and name with link to profile
- **Recipe Pages**: Display author information on recipe detail pages
- **Responsive**: Works on all screen sizes

## API Usage

### Get User Profile

```typescript
const { data: profile } = await supabase
  .from('profiles')
  .select('*')
  .eq('id', user.id)
  .single();
```

### Update Profile

```typescript
const { error } = await supabase
  .from('profiles')
  .update({
    username: 'newusername',
    full_name: 'John Doe',
    bio: 'Food enthusiast',
  })
  .eq('id', user.id);
```

### Upload Avatar

```typescript
const fileExt = file.name.split('.').pop();
const fileName = `${userId}/${Math.random()}.${fileExt}`;
const filePath = `avatars/${fileName}`;

const { error } = await supabase.storage
  .from('avatars')
  .upload(filePath, file, { upsert: true });
```

## Security

- **Row Level Security**: Enabled on profiles table
- **Public Read**: Anyone can view profiles
- **Private Write**: Only users can update their own profile
- **Storage Policies**: Users can only upload/update their own avatars

## Next Steps

Potential enhancements:
- Profile pages for viewing other users' profiles
- Recipe count on profiles
- User recipe collections
- Follow/unfollow functionality
- Profile verification badges

