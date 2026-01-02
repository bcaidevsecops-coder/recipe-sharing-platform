-- Traditional Hanoi-Style Vietnamese Recipes
-- Run this SQL in your Supabase SQL Editor to add Hanoi cuisine recipes
-- All recipes are automatically public due to RLS policy

-- ============================================================================
-- HANOI TRADITIONAL RECIPES
-- ============================================================================

-- Recipe 1: Pho Bo (Hanoi Beef Noodle Soup)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Pho Bo - Hanoi Beef Noodle Soup',
  ARRAY[
    '2 lbs beef bones',
    '1 lb beef brisket or chuck',
    '1 large onion, halved',
    '3-inch piece ginger, sliced',
    '2 cinnamon sticks',
    '3 star anise',
    '5 cloves',
    '1 cardamom pod',
    '1 tbsp coriander seeds',
    '8 cups water',
    '1 lb rice noodles (pho noodles)',
    '1/2 lb raw beef sirloin, thinly sliced',
    '1/2 cup bean sprouts',
    '1/4 cup Thai basil leaves',
    '1/4 cup cilantro',
    '2 limes, cut into wedges',
    '2 jalapeños, sliced',
    'Fish sauce to taste',
    'Salt to taste'
  ],
  ARRAY[
    'Char the onion and ginger over an open flame or under broiler until blackened.',
    'In a large pot, add beef bones and brisket. Cover with water and bring to boil. Skim off foam.',
    'Add charred onion, ginger, cinnamon, star anise, cloves, cardamom, and coriander seeds.',
    'Simmer for 2-3 hours until broth is rich and flavorful. Season with fish sauce and salt.',
    'Strain the broth and return to pot. Keep hot.',
    'Cook rice noodles according to package directions. Drain and divide among bowls.',
    'Slice the cooked brisket and arrange with raw sirloin over noodles.',
    'Ladle hot broth over noodles and meat.',
    'Serve immediately with bean sprouts, herbs, lime, and jalapeños on the side.',
    'Let diners add condiments to taste.'
  ],
  'soups',
  'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 2: Bun Cha (Hanoi Grilled Pork with Noodles)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Bun Cha - Hanoi Grilled Pork with Noodles',
  ARRAY[
    '1 lb ground pork',
    '1 lb pork shoulder, sliced thin',
    '2 tbsp fish sauce',
    '2 tbsp sugar',
    '1 tbsp honey',
    '3 cloves garlic, minced',
    '1 shallot, minced',
    'Black pepper',
    '1 lb rice vermicelli noodles',
    '1 head lettuce, leaves separated',
    '1 cup fresh herbs (mint, cilantro, perilla)',
    '1/2 cup pickled carrots and daikon',
    'Nuoc cham (dipping sauce):',
    '3 tbsp fish sauce',
    '3 tbsp lime juice',
    '2 tbsp sugar',
    '1/2 cup water',
    '2 cloves garlic, minced',
    '1-2 Thai chilies, minced'
  ],
  ARRAY[
    'Mix ground pork with 1 tbsp fish sauce, 1 tbsp sugar, garlic, shallot, and black pepper. Form into small patties.',
    'Marinate pork slices with remaining fish sauce, sugar, honey, and black pepper for 30 minutes.',
    'Grill pork patties and slices over charcoal or grill pan until cooked through and slightly charred.',
    'Cook rice vermicelli according to package directions. Rinse with cold water and drain.',
    'Make nuoc cham: dissolve sugar in water, add fish sauce, lime juice, garlic, and chilies.',
    'Arrange noodles in bowls with lettuce and herbs.',
    'Serve grilled pork on a separate plate with nuoc cham.',
    'Diners dip pork and noodles into the sauce and wrap in lettuce with herbs.'
  ],
  'main-courses',
  'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 3: Banh Mi (Vietnamese Baguette Sandwich)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Banh Mi - Vietnamese Baguette Sandwich',
  ARRAY[
    '4 Vietnamese baguettes or French rolls',
    '1 lb pork pate or liver pate',
    '1/2 lb Vietnamese ham (cha lua) or cooked pork',
    '1/2 cup pickled carrots and daikon',
    '2 cucumbers, julienned',
    '1/4 cup cilantro leaves',
    '2 jalapeños, sliced',
    'Mayonnaise',
    'Maggi seasoning sauce',
    'Soy sauce'
  ],
  ARRAY[
    'Slice baguettes lengthwise, leaving one edge attached.',
    'Lightly toast the baguettes until crispy on outside, soft inside.',
    'Spread pate on one side of the bread.',
    'Layer with Vietnamese ham or cooked pork.',
    'Add pickled carrots and daikon.',
    'Add cucumber, cilantro, and jalapeños.',
    'Drizzle with a little mayonnaise, Maggi sauce, and soy sauce.',
    'Close the sandwich and serve immediately.'
  ],
  'main-courses',
  'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 4: Ca Phe Trung (Hanoi Egg Coffee)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Ca Phe Trung - Hanoi Egg Coffee',
  ARRAY[
    '2 tbsp Vietnamese coffee (Trung Nguyen or similar)',
    '2 tbsp sweetened condensed milk',
    '1 egg yolk',
    '1 tbsp sugar',
    '1 cup hot water',
    'Vietnamese coffee filter (phin) or strong espresso'
  ],
  ARRAY[
    'Brew Vietnamese coffee using phin filter or make strong espresso.',
    'While coffee is brewing, separate egg yolk from white.',
    'In a bowl, whisk egg yolk with condensed milk and sugar until creamy and frothy.',
    'Pour hot coffee into a small cup.',
    'Gently spoon the egg cream mixture on top of the coffee.',
    'Serve immediately. Mix before drinking or sip through the creamy layer.',
    'Traditionally served in a small cup placed in a bowl of hot water to keep warm.'
  ],
  'beverages',
  'https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 5: Cha Ca La Vong (Hanoi Turmeric Fish)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Cha Ca La Vong - Hanoi Turmeric Fish',
  ARRAY[
    '1.5 lbs white fish fillets (catfish or cod)',
    '2 tbsp turmeric powder',
    '2 tbsp fish sauce',
    '1 tbsp sugar',
    '3 cloves garlic, minced',
    '1 shallot, minced',
    '1/2 cup dill, chopped',
    '1/2 cup green onions, chopped',
    '1 lb rice vermicelli noodles',
    '1/2 cup peanuts, crushed',
    'Nuoc cham (dipping sauce)',
    'Lettuce and herbs for serving',
    'Cooking oil'
  ],
  ARRAY[
    'Cut fish into bite-sized pieces.',
    'Marinate fish with turmeric, fish sauce, sugar, garlic, and shallot for 30 minutes.',
    'Heat oil in a pan or use a tabletop grill.',
    'Cook fish pieces until golden and cooked through.',
    'Add dill and green onions in the last minute of cooking.',
    'Cook rice vermicelli according to package directions.',
    'Serve fish hot over noodles with peanuts, herbs, lettuce, and nuoc cham.',
    'Diners wrap fish and noodles in lettuce with herbs and dip in sauce.'
  ],
  'main-courses',
  'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 6: Bun Thang (Hanoi Chicken Noodle Soup)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Bun Thang - Hanoi Chicken Noodle Soup',
  ARRAY[
    '1 whole chicken (3-4 lbs)',
    '8 cups water',
    '1 onion, halved',
    '3-inch piece ginger, sliced',
    '1 lb rice vermicelli noodles',
    '4 eggs',
    '1/2 cup Vietnamese sausage (cha lua), sliced',
    '1/2 cup dried shrimp, soaked',
    '1/2 cup shiitake mushrooms, sliced',
    '2 tbsp fish sauce',
    'Salt to taste',
    'Green onions, chopped',
    'Cilantro, chopped',
    'Fried shallots for garnish'
  ],
  ARRAY[
    'Place chicken in a large pot with water, onion, and ginger. Bring to boil, then simmer 1 hour.',
    'Remove chicken, let cool, then shred the meat. Strain and reserve the broth.',
    'Season broth with fish sauce and salt. Keep hot.',
    'Cook rice vermicelli according to package directions. Drain.',
    'Make thin omelets: beat eggs, cook in thin layers, then roll and slice into strips.',
    'Soak dried shrimp and slice Vietnamese sausage.',
    'Cook mushrooms briefly in the hot broth.',
    'Divide noodles among bowls. Top with shredded chicken, egg strips, sausage, shrimp, and mushrooms.',
    'Ladle hot broth over everything.',
    'Garnish with green onions, cilantro, and fried shallots.'
  ],
  'soups',
  'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 7: Banh Cuon (Steamed Rice Rolls)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Banh Cuon - Steamed Rice Rolls',
  ARRAY[
    '1 cup rice flour',
    '1/4 cup tapioca starch',
    '1/4 tsp salt',
    '1.5 cups water',
    '1/2 lb ground pork',
    '1/2 cup wood ear mushrooms, soaked and chopped',
    '1 shallot, minced',
    '2 tbsp fish sauce',
    '1 tsp sugar',
    'Black pepper',
    '1/2 cup fried shallots',
    'Nuoc cham (dipping sauce)',
    'Vietnamese sausage (cha lua), sliced',
    'Cucumber, sliced',
    'Herbs (cilantro, mint)'
  ],
  ARRAY[
    'Make batter: mix rice flour, tapioca starch, salt, and water until smooth. Let rest 30 minutes.',
    'Cook filling: sauté pork with mushrooms, shallot, fish sauce, sugar, and pepper until cooked.',
    'Heat a non-stick pan or steamer. Lightly oil the surface.',
    'Pour a thin layer of batter and steam until set (about 1-2 minutes).',
    'Place some filling on one side, then roll up the rice sheet.',
    'Repeat until all batter and filling is used.',
    'Serve warm with fried shallots, Vietnamese sausage, cucumber, herbs, and nuoc cham.'
  ],
  'appetizers',
  'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 8: Xoi (Sticky Rice with Toppings)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Xoi - Sticky Rice with Toppings',
  ARRAY[
    '2 cups glutinous rice (sticky rice)',
    '1/2 cup mung beans, split and peeled',
    '1/2 cup fried shallots',
    '1/4 cup Vietnamese sausage (cha lua), sliced',
    '2 tbsp cooking oil',
    'Salt to taste',
    'Soy sauce or fish sauce for serving'
  ],
  ARRAY[
    'Soak glutinous rice in water overnight or at least 4 hours.',
    'Soak mung beans separately for 2 hours.',
    'Steam mung beans until soft, then mash with a little salt.',
    'Drain rice and steam for 20-30 minutes until cooked and sticky.',
    'Heat oil in a pan and fry shallots until golden. Remove and set aside.',
    'In the same pan, briefly fry the Vietnamese sausage.',
    'To serve: place sticky rice in a bowl, top with mashed mung beans.',
    'Add fried shallots and sausage on top.',
    'Drizzle with soy sauce or fish sauce to taste.',
    'Mix everything together before eating.'
  ],
  'breakfast',
  'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 9: Nem Ran (Hanoi Spring Rolls)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Nem Ran - Hanoi Spring Rolls',
  ARRAY[
    '1/2 lb ground pork',
    '1/2 cup shrimp, minced',
    '1/2 cup crab meat (optional)',
    '1/2 cup wood ear mushrooms, soaked and chopped',
    '1/2 cup bean thread noodles, soaked and chopped',
    '1 carrot, julienned',
    '1 shallot, minced',
    '2 cloves garlic, minced',
    '1 egg',
    '2 tbsp fish sauce',
    '1 tsp sugar',
    'Black pepper',
    '20-25 spring roll wrappers (rice paper)',
    'Oil for frying',
    'Nuoc cham (dipping sauce)',
    'Lettuce and herbs for serving'
  ],
  ARRAY[
    'Mix pork, shrimp, crab (if using), mushrooms, noodles, carrot, shallot, and garlic.',
    'Add egg, fish sauce, sugar, and black pepper. Mix well.',
    'Soak rice paper wrappers briefly in warm water until pliable.',
    'Place a spoonful of filling on each wrapper and roll tightly, tucking in the sides.',
    'Heat oil to 350°F (175°C).',
    'Fry spring rolls in batches until golden brown and crispy, about 5-7 minutes.',
    'Drain on paper towels.',
    'Serve hot with lettuce, herbs, and nuoc cham.',
    'Wrap spring rolls in lettuce with herbs and dip in sauce.'
  ],
  'appetizers',
  'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- Recipe 10: Che (Vietnamese Sweet Dessert Soup)
INSERT INTO recipes (title, ingredients, steps, category, image_url, user_id)
VALUES (
  'Che - Vietnamese Sweet Dessert Soup',
  ARRAY[
    '1 cup mung beans, split and peeled',
    '1/2 cup sugar',
    '1/4 cup tapioca pearls',
    '1 can coconut milk',
    '1/2 cup coconut cream',
    '1/2 tsp vanilla extract',
    'Pinch of salt',
    'Ice cubes',
    'Toasted sesame seeds (optional)'
  ],
  ARRAY[
    'Soak mung beans for 2 hours, then steam or boil until soft.',
    'Cook tapioca pearls in boiling water until transparent, about 15 minutes. Drain.',
    'In a pot, heat coconut milk with sugar, vanilla, and salt until sugar dissolves.',
    'Add cooked mung beans and tapioca pearls. Simmer for 5 minutes.',
    'Let cool, then refrigerate until cold.',
    'To serve: place in bowls, add ice cubes, and drizzle with coconut cream.',
    'Garnish with toasted sesame seeds if desired.',
    'Serve chilled as a refreshing dessert.'
  ],
  'desserts',
  'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?w=800&h=600&fit=crop',
  (SELECT id FROM auth.users LIMIT 1)
) ON CONFLICT DO NOTHING;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

-- Check that Hanoi recipes were created
-- SELECT id, title, category, created_at FROM recipes WHERE title LIKE '%Hanoi%' OR title LIKE '%Pho%' OR title LIKE '%Bun%' OR title LIKE '%Banh%' OR title LIKE '%Cha%' OR title LIKE '%Xoi%' OR title LIKE '%Nem%' OR title LIKE '%Che%' ORDER BY created_at DESC;

-- All recipes are automatically public due to RLS policy "Anyone can view recipes"

