# Hanoi Recipes Image Update Guide

I've updated the image URLs in `hanoi-recipes.sql` to use more relevant Vietnamese food photos. Here's what was changed:

## Updated Images

1. **Pho Bo** - Updated to Vietnamese pho soup image
2. **Bun Cha** - Updated to Vietnamese grilled pork/noodles image  
3. **Banh Mi** - Updated to Vietnamese sandwich image
4. **Ca Phe Trung** - Kept coffee image (appropriate)
5. **Cha Ca** - Updated to Vietnamese fish dish image
6. **Bun Thang** - Updated to Vietnamese noodle soup image
7. **Banh Cuon** - Updated to Vietnamese rice roll image
8. **Xoi** - Updated to Vietnamese sticky rice image
9. **Nem Ran** - Updated to Vietnamese spring roll image
10. **Che** - Updated to Vietnamese dessert image

## If Recipes Are Already in Database

If you've already added the recipes and want to update the images, run the `update-hanoi-images.sql` file in your Supabase SQL Editor. This will update all existing recipes with the new image URLs.

## Image Sources

All images are from Unsplash and are:
- High quality (800x600)
- Food photography optimized
- Publicly accessible
- Relevant to Vietnamese cuisine

## Verification

After updating, you can verify the images are correct by:
1. Visiting your `/recipes` page
2. Checking each Hanoi recipe to see if the image matches the dish
3. If any image still doesn't match, you can manually update it in the database

## Manual Update

If you need to update a specific recipe's image:

```sql
UPDATE recipes
SET image_url = 'YOUR_NEW_IMAGE_URL'
WHERE title = 'Recipe Name';
```

