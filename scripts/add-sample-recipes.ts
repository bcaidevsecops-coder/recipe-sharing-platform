/**
 * Script to add sample recipes to the database
 * Run with: npx tsx scripts/add-sample-recipes.ts
 * 
 * Make sure your .env.local file has your Supabase credentials set up
 */

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase environment variables!');
  console.error('Please set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY in your .env.local file');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const sampleRecipes = [
  {
    title: 'Classic Chocolate Chip Cookies',
    ingredients: [
      '2 1/4 cups all-purpose flour',
      '1 tsp baking soda',
      '1 tsp salt',
      '1 cup butter, softened',
      '3/4 cup granulated sugar',
      '3/4 cup packed brown sugar',
      '2 large eggs',
      '2 tsp vanilla extract',
      '2 cups chocolate chips',
    ],
    steps: [
      'Preheat oven to 375°F (190°C).',
      'In a small bowl, mix flour, baking soda, and salt. Set aside.',
      'In a large bowl, cream together the butter and both sugars until smooth.',
      'Beat in eggs and vanilla extract.',
      'Gradually blend in the flour mixture.',
      'Stir in chocolate chips.',
      'Drop rounded tablespoons of dough onto ungreased cookie sheets.',
      'Bake for 9-11 minutes or until golden brown.',
      'Cool on baking sheet for 2 minutes before removing to wire rack.',
    ],
    category: 'desserts',
    image_url: 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800&h=600&fit=crop',
  },
  {
    title: 'Spaghetti Carbonara',
    ingredients: [
      '1 lb spaghetti',
      '8 oz pancetta or bacon, diced',
      '4 large eggs',
      '1 cup grated Parmesan cheese',
      '1/2 cup heavy cream',
      '4 cloves garlic, minced',
      'Salt and black pepper to taste',
      'Fresh parsley for garnish',
    ],
    steps: [
      'Bring a large pot of salted water to boil and cook spaghetti according to package directions.',
      'While pasta cooks, heat a large skillet over medium heat and cook pancetta until crispy.',
      'In a bowl, whisk together eggs, Parmesan cheese, and cream.',
      'Drain pasta, reserving 1 cup of pasta water.',
      'Add hot pasta to the skillet with pancetta, remove from heat.',
      'Quickly toss in the egg mixture, adding pasta water as needed to create a creamy sauce.',
      'Season with salt and pepper.',
      'Serve immediately, garnished with parsley and extra Parmesan.',
    ],
    category: 'main-courses',
    image_url: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800&h=600&fit=crop',
  },
  {
    title: 'Fresh Garden Salad',
    ingredients: [
      '6 cups mixed greens (lettuce, spinach, arugula)',
      '1 cup cherry tomatoes, halved',
      '1/2 cup cucumber, sliced',
      '1/4 cup red onion, thinly sliced',
      '1/4 cup feta cheese, crumbled',
      '1/4 cup walnuts, chopped',
      '3 tbsp olive oil',
      '2 tbsp balsamic vinegar',
      '1 tsp Dijon mustard',
      'Salt and pepper to taste',
    ],
    steps: [
      'Wash and dry all greens thoroughly.',
      'Combine greens, tomatoes, cucumber, and red onion in a large bowl.',
      'In a small bowl, whisk together olive oil, balsamic vinegar, Dijon mustard, salt, and pepper.',
      'Drizzle dressing over salad and toss gently.',
      'Top with feta cheese and walnuts.',
      'Serve immediately.',
    ],
    category: 'salads',
    image_url: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop',
  },
  {
    title: 'Homemade Chicken Noodle Soup',
    ingredients: [
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
      'Fresh parsley for garnish',
    ],
    steps: [
      'Heat olive oil in a large pot over medium heat.',
      'Add chicken and cook until no longer pink, about 5-7 minutes.',
      'Add carrots, celery, and onion. Cook until vegetables begin to soften, about 5 minutes.',
      'Add garlic and cook for 1 minute more.',
      'Pour in chicken broth and add thyme and bay leaf. Bring to a boil.',
      'Reduce heat and simmer for 15 minutes.',
      'Add egg noodles and cook according to package directions.',
      'Season with salt and pepper.',
      'Remove bay leaf and serve hot, garnished with fresh parsley.',
    ],
    category: 'soups',
    image_url: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop',
  },
  {
    title: 'Perfect Avocado Toast',
    ingredients: [
      '2 slices sourdough bread',
      '1 ripe avocado',
      '1/2 lemon, juiced',
      '2 eggs (optional)',
      'Red pepper flakes',
      'Salt and pepper to taste',
      'Microgreens or sprouts (optional)',
      'Everything bagel seasoning (optional)',
    ],
    steps: [
      'Toast the bread until golden and crispy.',
      'Cut avocado in half, remove pit, and scoop flesh into a bowl.',
      'Mash avocado with a fork, leaving some chunks for texture.',
      'Add lemon juice, salt, and pepper. Mix gently.',
      'If using eggs, fry or poach them to your preference.',
      'Spread avocado mixture evenly on toast.',
      'Top with eggs (if using), red pepper flakes, and microgreens.',
      'Sprinkle with everything bagel seasoning if desired.',
      'Serve immediately.',
    ],
    category: 'breakfast',
    image_url: 'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800&h=600&fit=crop',
  },
];

async function addSampleRecipes() {
  console.log('🍳 Adding sample recipes...\n');

  // Get the first user (or you can specify a user ID)
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    // Try to get any user from the database
    const { data: users } = await supabase.auth.admin.listUsers();
    if (!users || users.users.length === 0) {
      console.error('❌ No users found. Please create a user account first.');
      process.exit(1);
    }
    console.log('⚠️  Not authenticated. Using first available user.');
  }

  // Get user ID - either from auth or from profiles
  let userId: string;
  if (user) {
    userId = user.id;
  } else {
    const { data: profiles } = await supabase.from('profiles').select('id').limit(1).single();
    if (!profiles) {
      console.error('❌ No users found. Please create a user account first.');
      process.exit(1);
    }
    userId = profiles.id;
  }

  console.log(`Using user ID: ${userId}\n`);

  let successCount = 0;
  let errorCount = 0;

  for (const recipe of sampleRecipes) {
    const { error } = await supabase.from('recipes').insert({
      ...recipe,
      user_id: userId,
    });

    if (error) {
      console.error(`❌ Error adding "${recipe.title}":`, error.message);
      errorCount++;
    } else {
      console.log(`✅ Added: ${recipe.title}`);
      successCount++;
    }
  }

  console.log(`\n✨ Done! Added ${successCount} recipes.`);
  if (errorCount > 0) {
    console.log(`⚠️  ${errorCount} recipes failed to add.`);
  }
}

addSampleRecipes();

