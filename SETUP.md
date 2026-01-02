# Quick Setup Guide

## Step 1: Install Dependencies

```bash
npm install
```

## Step 2: Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project
3. Wait for the project to be fully provisioned (takes ~2 minutes)

## Step 3: Get Your Supabase Credentials

1. In your Supabase project dashboard, go to **Settings** → **API**
2. Copy the following:
   - **Project URL** (under "Project URL")
   - **anon public** key (under "Project API keys")

## Step 4: Set Up Environment Variables

Create a `.env.local` file in the root directory:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## Step 5: Set Up Database

1. In your Supabase dashboard, go to **SQL Editor**
2. Click **New Query**
3. Copy the entire contents of `supabase-schema.sql`
4. Paste it into the SQL Editor
5. Click **Run** (or press Cmd/Ctrl + Enter)

This will create:
- The `recipes` table
- Row Level Security policies
- Storage bucket for images
- Storage policies

## Step 6: Run the Development Server

```bash
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) and you're ready to go!

## Step 7: Create Your First Recipe

1. Sign up for an account
2. Click "New Recipe" in the navigation
3. Fill in the recipe details and upload an image
4. Click "Create Recipe"

## Troubleshooting

### "Invalid API key" error
- Double-check your `.env.local` file has the correct values
- Make sure there are no extra spaces or quotes
- Restart your dev server after changing environment variables

### "Table does not exist" error
- Make sure you ran the SQL schema in Supabase SQL Editor
- Check that the `recipes` table exists in your Supabase dashboard (Table Editor)

### Images not uploading
- Verify the storage bucket `recipe-images` was created (check Storage in Supabase dashboard)
- If not, the SQL script should have created it, but you can create it manually:
  1. Go to Storage in Supabase dashboard
  2. Create a new bucket named `recipe-images`
  3. Make it public
  4. Set the policies as shown in the SQL file

### Can't see recipes
- Make sure you're logged in (recipes require authentication to view)
- Check that Row Level Security policies were created correctly

## Next Steps

- Deploy to Vercel for production
- Customize the categories in `types/database.ts`
- Add more features like recipe editing, favorites, or comments!

