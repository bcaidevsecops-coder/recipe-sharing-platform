# Adding Sample Recipes

This guide explains how to add sample recipes to your Recipe Sharing Platform.

## Method 1: Using SQL (Recommended)

The easiest way is to use the SQL script:

1. **Get a User ID**
   - Go to your Supabase dashboard
   - Navigate to **Authentication** → **Users**
   - Copy a user ID (or create a test user first)

2. **Update the SQL Script**
   - Open `sample-recipes.sql`
   - Replace `(SELECT id FROM auth.users LIMIT 1)` with your actual user ID, or leave it as is to use the first user

3. **Run the SQL**
   - Go to **SQL Editor** in Supabase
   - Paste the contents of `sample-recipes.sql`
   - Click **Run**

This will create 10 sample recipes with images from Unsplash.

## Method 2: Using TypeScript Script

If you prefer using a script:

1. **Install tsx** (if not already installed):
   ```bash
   npm install -D tsx
   ```

2. **Make sure you're logged in** or have a user account

3. **Run the script**:
   ```bash
   npx tsx scripts/add-sample-recipes.ts
   ```

## Sample Recipes Included

1. **Classic Chocolate Chip Cookies** (Desserts)
2. **Spaghetti Carbonara** (Main Courses)
3. **Fresh Garden Salad** (Salads)
4. **Homemade Chicken Noodle Soup** (Soups)
5. **Perfect Avocado Toast** (Breakfast)
6. **Classic Margherita Pizza** (Main Courses)
7. **Fudgy Chocolate Brownies** (Desserts)
8. **Fresh Squeezed Lemonade** (Beverages)
9. **Garlic Bread** (Appetizers)
10. **Homemade Trail Mix** (Snacks)

## Images

All recipes use high-quality images from Unsplash. These are public URLs that will work immediately. The images are:
- Publicly accessible
- High resolution
- Food photography optimized

## Making Recipes Public

All recipes are **already public** by default due to the Row Level Security policy:
- Policy: "Anyone can view recipes" allows public read access
- No additional configuration needed

## Verifying Recipes

After adding the recipes, you can verify they're public by:

1. **In Supabase Dashboard**:
   ```sql
   SELECT id, title, category, created_at 
   FROM recipes 
   ORDER BY created_at DESC;
   ```

2. **In Your App**:
   - Visit `/recipes` page
   - You should see all the sample recipes
   - Try searching and filtering by category

## Customizing Sample Recipes

You can modify the recipes in `sample-recipes.sql` to:
- Change ingredients
- Adjust steps
- Use different categories
- Add your own image URLs
- Create more recipes

## Adding Your Own Images

If you want to use your own images:

1. **Upload to Supabase Storage**:
   - Go to **Storage** → **recipe-images** bucket
   - Upload your images
   - Copy the public URL

2. **Update Recipes**:
   - Replace the `image_url` in the SQL with your Supabase storage URLs
   - Format: `https://[your-project].supabase.co/storage/v1/object/public/recipe-images/[filename]`

## Troubleshooting

### "No users found"
- Create a user account first by signing up in your app
- Or manually create a user in Supabase Authentication

### "Permission denied"
- Make sure you're running the SQL as a user with proper permissions
- Check that RLS policies are set up correctly

### Images not showing
- Check that the Unsplash URLs are accessible
- Verify your app can load external images
- Check browser console for CORS errors

