-- Quick fix for broken Trail Mix image
-- Run this in Supabase SQL Editor to update the existing recipe

UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop'
WHERE title = 'Homemade Trail Mix'
AND image_url = 'https://images.unsplash.com/photo-1599599810769-14d6740b4a51?w=800&h=600&fit=crop';

-- Verify the update
-- SELECT title, image_url FROM recipes WHERE title = 'Homemade Trail Mix';

