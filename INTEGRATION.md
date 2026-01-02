# Supabase Integration Guide

Follow these steps to connect your Recipe Sharing Platform to your Supabase project.

## Step 1: Get Your Supabase Credentials

1. Go to your Supabase project dashboard: https://app.supabase.com
2. Select your project
3. Click on **Settings** (gear icon) in the left sidebar
4. Click on **API** under "Project Settings"
5. You'll see:
   - **Project URL** - Copy this value (looks like: `https://xxxxx.supabase.co`)
   - **anon public** key (under "Project API keys") - Copy this value (long string starting with `eyJ...`)

## Step 2: Create Environment Variables File

Create a file named `.env.local` in the root of your project with:

```env
NEXT_PUBLIC_SUPABASE_URL=your_project_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here
```

Replace the placeholder values with your actual credentials from Step 1.

## Step 3: Set Up Database Schema

1. In your Supabase dashboard, click on **SQL Editor** in the left sidebar
2. Click **New Query**
3. Open the file `supabase-schema.sql` from this project
4. Copy the entire contents
5. Paste it into the SQL Editor
6. Click **Run** (or press Cmd/Ctrl + Enter)

This will create:
- ✅ The `recipes` table
- ✅ Row Level Security policies
- ✅ Storage bucket for images (`recipe-images`)
- ✅ Storage policies
- ✅ Indexes for better performance

## Step 4: Verify Storage Bucket

1. In Supabase dashboard, click on **Storage** in the left sidebar
2. You should see a bucket named `recipe-images`
3. If it's not there, the SQL should have created it, but you can verify by:
   - Clicking "New bucket"
   - Name: `recipe-images`
   - Make it **Public**
   - Click "Create bucket"

## Step 5: Test the Connection

1. Make sure your `.env.local` file is set up correctly
2. Install dependencies (if not already done):
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```
4. Open http://localhost:3000 in your browser
5. Try signing up for an account
6. Create a recipe to test everything works

## Troubleshooting

### "Invalid API key" error
- Double-check your `.env.local` file has the correct values
- Make sure there are no extra spaces or quotes around the values
- Restart your dev server after changing environment variables

### "Table does not exist" error
- Make sure you ran the SQL schema in Supabase SQL Editor
- Check that the `recipes` table exists in your Supabase dashboard (Table Editor)

### Images not uploading
- Verify the storage bucket `recipe-images` exists (check Storage in Supabase dashboard)
- Make sure the bucket is set to **Public**
- Check that the storage policies were created (they're in the SQL file)

### Can't sign up/login
- Check that Row Level Security policies were created correctly
- Verify your Supabase project is active and not paused

## Next Steps

Once everything is working:
- Deploy to Vercel for production
- Add your environment variables to Vercel project settings
- Customize the categories in `types/database.ts`
- Add more features like recipe editing, favorites, or comments!
