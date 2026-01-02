import { createClient } from '@/lib/supabase/server';
import { redirect, notFound } from 'next/navigation';
import Image from 'next/image';
import Link from 'next/link';
import { Recipe } from '@/types/database';
import { RECIPE_CATEGORIES } from '@/types/database';

async function getRecipe(id: string): Promise<Recipe | null> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from('recipes')
    .select('*')
    .eq('id', id)
    .single();

  if (error || !data) {
    return null;
  }

  return data as Recipe;
}

async function getRecipeAuthor(userId: string) {
  const supabase = await createClient();
  const { data } = await supabase
    .from('profiles')
    .select('username, full_name, avatar_url')
    .eq('id', userId)
    .single();

  return data;
}

export default async function RecipeDetailPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const recipe = await getRecipe(id);

  if (!recipe) {
    notFound();
  }

  const author = await getRecipeAuthor(recipe.user_id);
  const categoryLabel =
    RECIPE_CATEGORIES.find((c) => c.value === recipe.category)?.label ||
    recipe.category;

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-4xl px-4 py-8 sm:px-6 lg:px-8">
        <Link
          href="/recipes"
          className="mb-4 inline-flex items-center text-sm text-indigo-600 hover:text-indigo-500"
        >
          ← Back to recipes
        </Link>

        <article className="overflow-hidden rounded-lg bg-white shadow">
          {recipe.image_url && (
            <div className="relative h-64 w-full sm:h-96">
              <Image
                src={recipe.image_url}
                alt={recipe.title}
                fill
                className="object-cover"
                priority
              />
            </div>
          )}

          <div className="px-6 py-8 sm:px-8">
            <div className="mb-4 flex items-center justify-between">
              <span className="inline-flex items-center rounded-full bg-indigo-100 px-3 py-1 text-sm font-medium text-indigo-800">
                {categoryLabel}
              </span>
              {author && (
                <div className="flex items-center space-x-2 text-sm text-gray-600">
                  {author.avatar_url && (
                    <Image
                      src={author.avatar_url}
                      alt={author.full_name || author.username || 'Author'}
                      width={24}
                      height={24}
                      className="h-6 w-6 rounded-full object-cover"
                    />
                  )}
                  <span>
                    by {author.full_name || author.username || 'Anonymous'}
                  </span>
                </div>
              )}
            </div>

            <h1 className="mb-4 text-3xl font-bold text-gray-900">
              {recipe.title}
            </h1>

            <div className="mb-8">
              <h2 className="mb-3 text-xl font-semibold text-gray-900">
                Ingredients
              </h2>
              <ul className="space-y-2">
                {recipe.ingredients.map((ingredient, index) => (
                  <li
                    key={index}
                    className="flex items-start text-gray-700"
                  >
                    <span className="mr-2 text-indigo-600">•</span>
                    <span>{ingredient}</span>
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <h2 className="mb-3 text-xl font-semibold text-gray-900">
                Instructions
              </h2>
              <ol className="space-y-4">
                {recipe.steps.map((step, index) => (
                  <li key={index} className="flex">
                    <span className="mr-4 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-indigo-100 text-sm font-medium text-indigo-800">
                      {index + 1}
                    </span>
                    <p className="text-gray-700">{step}</p>
                  </li>
                ))}
              </ol>
            </div>

            <div className="mt-8 border-t border-gray-200 pt-6">
              <p className="text-sm text-gray-500">
                Created on{' '}
                {new Date(recipe.created_at).toLocaleDateString('en-US', {
                  year: 'numeric',
                  month: 'long',
                  day: 'numeric',
                })}
              </p>
            </div>
          </div>
        </article>
      </div>
    </div>
  );
}
