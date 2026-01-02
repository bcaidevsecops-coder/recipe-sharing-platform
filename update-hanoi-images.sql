-- Update image URLs for Hanoi recipes with more relevant Vietnamese food photos
-- Run this SQL in your Supabase SQL Editor to update existing recipes

-- Pho Bo - Vietnamese pho soup
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&h=600&fit=crop'
WHERE title = 'Pho Bo - Hanoi Beef Noodle Soup';

-- Bun Cha - Vietnamese grilled pork
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop'
WHERE title = 'Bun Cha - Hanoi Grilled Pork with Noodles';

-- Banh Mi - Vietnamese sandwich
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=800&h=600&fit=crop'
WHERE title = 'Banh Mi - Vietnamese Baguette Sandwich';

-- Ca Phe Trung - Egg coffee (keeping original as it's appropriate)
-- No update needed - coffee image is fine

-- Cha Ca - Turmeric fish
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=800&h=600&fit=crop'
WHERE title = 'Cha Ca La Vong - Hanoi Turmeric Fish';

-- Bun Thang - Chicken noodle soup (using pho image as similar dish)
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&h=600&fit=crop'
WHERE title = 'Bun Thang - Hanoi Chicken Noodle Soup';

-- Banh Cuon - Rice rolls
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800&h=600&fit=crop'
WHERE title = 'Banh Cuon - Steamed Rice Rolls';

-- Xoi - Sticky rice
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop'
WHERE title = 'Xoi - Sticky Rice with Toppings';

-- Nem Ran - Spring rolls
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop'
WHERE title = 'Nem Ran - Hanoi Spring Rolls';

-- Che - Sweet dessert soup
UPDATE recipes
SET image_url = 'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?w=800&h=600&fit=crop'
WHERE title = 'Che - Vietnamese Sweet Dessert Soup';

-- Verify updates
-- SELECT title, image_url FROM recipes WHERE title LIKE '%Pho%' OR title LIKE '%Bun%' OR title LIKE '%Banh%' OR title LIKE '%Cha%' OR title LIKE '%Xoi%' OR title LIKE '%Nem%' OR title LIKE '%Che%' OR title LIKE '%Ca Phe%';

