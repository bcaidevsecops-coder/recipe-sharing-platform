# Recipe Sharing Platform

A modern web application for sharing and discovering recipes, built with Next.js 16, React 19, TypeScript, Tailwind CSS, and Supabase.

## Features

- **User Authentication**: Sign up, log in, and password reset functionality using Supabase Auth
- **Recipe Management**: Upload recipes with title, ingredients, steps, and optional images
- **Recipe Browsing**: View all recipes in a beautiful grid layout
- **Recipe Details**: View detailed recipe pages with full instructions
- **Search & Filter**: Search recipes by keyword and filter by category
- **Responsive Design**: Mobile-friendly interface that works on all devices
- **Image Upload**: Upload and display recipe images using Supabase Storage

## Tech Stack

- **Frontend**: Next.js 16, React 19, TypeScript, Tailwind CSS
- **Backend**: Supabase (PostgreSQL database, Authentication, Storage)
- **Deployment**: Vercel (recommended)

## Prerequisites

- Node.js 18+ installed
- A Supabase account (free tier works fine)
- npm, yarn, pnpm, or bun package manager

## Setup Instructions

### 1. Clone and Install Dependencies

```bash
cd recipe-sharing-platform
npm install
```

### 2. Set Up Supabase

1. Create a new project at [supabase.com](https://supabase.com)
2. Go to your project settings → API
3. Copy your project URL and anon/public key

### 3. Configure Environment Variables

Create a `.env.local` file in the root directory:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 4. Set Up Database Schema

1. Go to your Supabase project dashboard
2. Navigate to SQL Editor
3. Copy and paste the contents of `supabase-schema.sql`
4. Run the SQL script to create the necessary tables, policies, and storage bucket

### 5. Run the Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
recipe-sharing-platform/
├── app/                    # Next.js App Router pages
│   ├── login/             # Login page
│   ├── signup/            # Signup page
│   ├── reset-password/    # Password reset page
│   ├── recipes/           # Recipe pages
│   │   ├── [id]/         # Recipe detail page
│   │   └── new/          # Create recipe page
│   └── page.tsx          # Home page
├── components/            # React components
│   ├── navbar.tsx        # Navigation bar
│   ├── recipe-form.tsx   # Recipe creation form
│   ├── recipes-list.tsx  # Recipe grid/list
│   └── search-and-filter.tsx # Search and filter UI
├── lib/                   # Utility functions
│   └── supabase/         # Supabase client setup
├── types/                 # TypeScript type definitions
└── middleware.ts          # Next.js middleware for auth
```

## Database Schema

The application uses the following main table:

- **recipes**: Stores recipe data including title, ingredients, steps, category, and image URL

See `supabase-schema.sql` for the complete schema including Row Level Security policies.

## Features in Detail

### Authentication

- Email/password authentication via Supabase
- Password reset functionality
- Protected routes (recipes require authentication)
- Session management with middleware

### Recipe Management

- Create recipes with:
  - Title
  - Category (appetizers, main courses, desserts, etc.)
  - Multiple ingredients (dynamically add/remove)
  - Multiple steps (dynamically add/remove)
  - Optional image upload
- View all recipes in a responsive grid
- View individual recipe details
- Search recipes by title or ingredients
- Filter recipes by category

### Image Storage

Images are stored in Supabase Storage in a public bucket called `recipe-images`. The storage policies allow:
- Anyone to view images
- Authenticated users to upload images
- Users to update/delete their own images

## Deployment

### Deploy to Vercel

1. Push your code to GitHub
2. Import your repository in Vercel
3. Add your environment variables in Vercel project settings
4. Deploy!

The Supabase database and storage are already hosted, so no additional backend deployment is needed.

## Environment Variables

Required environment variables:

- `NEXT_PUBLIC_SUPABASE_URL`: Your Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Your Supabase anon/public key

## Troubleshooting

### Common Issues

1. **"Invalid API key"**: Make sure your `.env.local` file has the correct Supabase credentials
2. **"Table does not exist"**: Run the SQL schema in your Supabase SQL Editor
3. **"Storage bucket not found"**: The SQL schema creates the bucket automatically, but you can also create it manually in Supabase Storage settings
4. **Images not uploading**: Check that the storage bucket policies are set correctly

## License

This project is open source and available under the MIT License.
