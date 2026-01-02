import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';
import RecipesList from '@/components/recipes-list';
import SearchAndFilter from '@/components/search-and-filter';

export default async function RecipesPage({
  searchParams,
}: {
  searchParams: Promise<{ search?: string; category?: string }>;
}) {
  const supabase = await createClient();

  const params = await searchParams;
  const search = params.search || '';
  const category = params.category || '';

  let query = supabase
    .from('recipes')
    .select('*')
    .order('created_at', { ascending: false });

  if (search) {
    // Search in title (case-insensitive)
    query = query.ilike('title', `%${search}%`);
  }

  if (category) {
    query = query.eq('category', category);
  }

  const { data: recipes, error } = await query;

  if (error) {
    console.error('Error fetching recipes:', error);
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">All Recipes</h1>
          <p className="mt-2 text-gray-600">
            Discover and share delicious recipes from our community
          </p>
        </div>

        <SearchAndFilter initialSearch={search} initialCategory={category} />

        <RecipesList recipes={recipes || []} />
      </div>
    </div>
  );
}

