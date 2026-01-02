-- Sample Recipes for Recipe Sharing Platform
-- Run this SQL in your Supabase SQL Editor after running the main schema
-- This will create sample recipes that are publicly viewable

-- First, you'll need to create a test user or use an existing user ID
-- Replace 'YOUR_USER_ID_HERE' with an actual user ID from auth.users table
-- You can get a user ID by running: SELECT id FROM auth.users LIMIT 1;

-- ============================================================================
-- SAMPLE RECIPES
-- ============================================================================

-- Recipe 1: Classic Chocolate Chip Cookies
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Classic Chocolate Chip Cookies',
  ARRAY[
    '2 1/4 cups all-purpose flour',
    '1 tsp baking soda',
    '1 tsp salt',
    '1 cup butter, softened',
    '3/4 cup granulated sugar',
    '3/4 cup packed brown sugar',
    '2 large eggs',
    '2 tsp vanilla extract',
    '2 cups chocolate chips'
  ],
  ARRAY[
    'Preheat oven to 375°F (190°C).',
    'In a small bowl, mix flour, baking soda, and salt. Set aside.',
    'In a large bowl, cream together the butter and both sugars until smooth.',
    'Beat in eggs and vanilla extract.',
    'Gradually blend in the flour mixture.',
    'Stir in chocolate chips.',
    'Drop rounded tablespoons of dough onto ungreased cookie sheets.',
    'Bake for 9-11 minutes or until golden brown.',
    'Cool on baking sheet for 2 minutes before removing to wire rack.'
  ],
  'desserts',
  'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 2: Spaghetti Carbonara
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Spaghetti Carbonara',
  ARRAY[
    '1 lb spaghetti',
    '8 oz pancetta or bacon, diced',
    '4 large eggs',
    '1 cup grated Parmesan cheese',
    '1/2 cup heavy cream',
    '4 cloves garlic, minced',
    'Salt and black pepper to taste',
    'Fresh parsley for garnish'
  ],
  ARRAY[
    'Bring a large pot of salted water to boil and cook spaghetti according to package directions.',
    'While pasta cooks, heat a large skillet over medium heat and cook pancetta until crispy.',
    'In a bowl, whisk together eggs, Parmesan cheese, and cream.',
    'Drain pasta, reserving 1 cup of pasta water.',
    'Add hot pasta to the skillet with pancetta, remove from heat.',
    'Quickly toss in the egg mixture, adding pasta water as needed to create a creamy sauce.',
    'Season with salt and pepper.',
    'Serve immediately, garnished with parsley and extra Parmesan.'
  ],
  'main-courses',
  'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 3: Fresh Garden Salad
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Fresh Garden Salad',
  ARRAY[
    '6 cups mixed greens (lettuce, spinach, arugula)',
    '1 cup cherry tomatoes, halved',
    '1/2 cup cucumber, sliced',
    '1/4 cup red onion, thinly sliced',
    '1/4 cup feta cheese, crumbled',
    '1/4 cup walnuts, chopped',
    '3 tbsp olive oil',
    '2 tbsp balsamic vinegar',
    '1 tsp Dijon mustard',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Wash and dry all greens thoroughly.',
    'Combine greens, tomatoes, cucumber, and red onion in a large bowl.',
    'In a small bowl, whisk together olive oil, balsamic vinegar, Dijon mustard, salt, and pepper.',
    'Drizzle dressing over salad and toss gently.',
    'Top with feta cheese and walnuts.',
    'Serve immediately.'
  ],
  'salads',
  'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 4: Chicken Noodle Soup
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Homemade Chicken Noodle Soup',
  ARRAY[
    '2 lbs chicken breast, diced',
    '8 cups chicken broth',
    '2 cups egg noodles',
    '1 cup carrots, diced',
    '1 cup celery, diced',
    '1/2 cup onion, diced',
    '3 cloves garlic, minced',
    '2 tbsp olive oil',
    '1 tsp dried thyme',
    '1 bay leaf',
    'Salt and pepper to taste',
    'Fresh parsley for garnish'
  ],
  ARRAY[
    'Heat olive oil in a large pot over medium heat.',
    'Add chicken and cook until no longer pink, about 5-7 minutes.',
    'Add carrots, celery, and onion. Cook until vegetables begin to soften, about 5 minutes.',
    'Add garlic and cook for 1 minute more.',
    'Pour in chicken broth and add thyme and bay leaf. Bring to a boil.',
    'Reduce heat and simmer for 15 minutes.',
    'Add egg noodles and cook according to package directions.',
    'Season with salt and pepper.',
    'Remove bay leaf and serve hot, garnished with fresh parsley.'
  ],
  'soups',
  'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 5: Avocado Toast
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Perfect Avocado Toast',
  ARRAY[
    '2 slices sourdough bread',
    '1 ripe avocado',
    '1/2 lemon, juiced',
    '2 eggs (optional)',
    'Red pepper flakes',
    'Salt and pepper to taste',
    'Microgreens or sprouts (optional)',
    'Everything bagel seasoning (optional)'
  ],
  ARRAY[
    'Toast the bread until golden and crispy.',
    'Cut avocado in half, remove pit, and scoop flesh into a bowl.',
    'Mash avocado with a fork, leaving some chunks for texture.',
    'Add lemon juice, salt, and pepper. Mix gently.',
    'If using eggs, fry or poach them to your preference.',
    'Spread avocado mixture evenly on toast.',
    'Top with eggs (if using), red pepper flakes, and microgreens.',
    'Sprinkle with everything bagel seasoning if desired.',
    'Serve immediately.'
  ],
  'breakfast',
  'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 6: Margherita Pizza
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Classic Margherita Pizza',
  ARRAY[
    '1 lb pizza dough',
    '1/2 cup tomato sauce',
    '8 oz fresh mozzarella, sliced',
    '1/4 cup fresh basil leaves',
    '2 tbsp olive oil',
    '2 cloves garlic, minced',
    'Salt to taste',
    'Cornmeal for dusting'
  ],
  ARRAY[
    'Preheat oven to 475°F (245°C) with pizza stone if available.',
    'Roll out pizza dough on a floured surface to desired thickness.',
    'Transfer to a pizza pan or baking sheet dusted with cornmeal.',
    'Spread tomato sauce evenly over dough, leaving a border for the crust.',
    'Arrange mozzarella slices over the sauce.',
    'Drizzle with olive oil and sprinkle with minced garlic.',
    'Bake for 12-15 minutes until crust is golden and cheese is bubbly.',
    'Remove from oven and immediately top with fresh basil leaves.',
    'Slice and serve hot.'
  ],
  'main-courses',
  'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 7: Chocolate Brownies
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Fudgy Chocolate Brownies',
  ARRAY[
    '1 cup butter',
    '2 cups granulated sugar',
    '4 large eggs',
    '1 tsp vanilla extract',
    '1 cup all-purpose flour',
    '3/4 cup cocoa powder',
    '1/2 tsp salt',
    '1/2 tsp baking powder',
    '1 cup chocolate chips'
  ],
  ARRAY[
    'Preheat oven to 350°F (175°C). Grease a 9x13 inch pan.',
    'Melt butter in a large saucepan over low heat.',
    'Remove from heat and stir in sugar, eggs, and vanilla.',
    'In a separate bowl, combine flour, cocoa, salt, and baking powder.',
    'Gradually blend flour mixture into the butter mixture.',
    'Stir in chocolate chips.',
    'Spread batter evenly into the prepared pan.',
    'Bake for 25-30 minutes until a toothpick inserted comes out with moist crumbs.',
    'Cool completely before cutting into squares.'
  ],
  'desserts',
  'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 8: Fresh Lemonade
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Fresh Squeezed Lemonade',
  ARRAY[
    '6-8 large lemons',
    '1 cup granulated sugar',
    '6 cups cold water',
    'Ice cubes',
    'Lemon slices for garnish',
    'Fresh mint leaves (optional)'
  ],
  ARRAY[
    'Juice the lemons to get about 1 cup of fresh lemon juice.',
    'In a small saucepan, combine sugar and 1 cup of water.',
    'Heat over medium heat, stirring until sugar dissolves completely.',
    'Remove from heat and let cool to room temperature.',
    'In a large pitcher, combine lemon juice, sugar syrup, and remaining 5 cups of water.',
    'Stir well and refrigerate until chilled.',
    'Serve over ice, garnished with lemon slices and mint leaves.',
    'Adjust sweetness by adding more sugar or water to taste.'
  ],
  'beverages',
  'https://images.unsplash.com/photo-1523677011783-c91d1bbe2fdc?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 9: Garlic Bread
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Garlic Bread',
  ARRAY[
    '1 loaf French bread or Italian bread',
    '1/2 cup butter, softened',
    '4 cloves garlic, minced',
    '2 tbsp fresh parsley, chopped',
    '1/4 cup Parmesan cheese, grated',
    'Salt to taste'
  ],
  ARRAY[
    'Preheat oven to 375°F (190°C).',
    'Cut bread into 1-inch slices, but don''t cut all the way through.',
    'In a small bowl, mix together butter, garlic, parsley, and salt.',
    'Spread the garlic butter mixture between each slice and on top of the loaf.',
    'Sprinkle with Parmesan cheese.',
    'Wrap in aluminum foil and bake for 15 minutes.',
    'Open foil and bake for 5 more minutes until golden and crispy.',
    'Serve hot.'
  ],
  'appetizers',
  'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 10: Trail Mix
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Homemade Trail Mix',
  ARRAY[
    '1 cup almonds',
    '1 cup cashews',
    '1/2 cup dried cranberries',
    '1/2 cup raisins',
    '1/2 cup dark chocolate chips',
    '1/2 cup pumpkin seeds',
    '1/4 cup coconut flakes (optional)'
  ],
  ARRAY[
    'Combine all ingredients in a large bowl.',
    'Mix thoroughly until well distributed.',
    'Store in an airtight container.',
    'Enjoy as a healthy snack on the go!'
  ],
  'snacks',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

-- Check that recipes were created
-- SELECT id, title, category, created_at FROM recipes ORDER BY created_at DESC;

-- All recipes are automatically public due to RLS policy "Anyone can view recipes"

