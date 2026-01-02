import Link from 'next/link';
import Image from 'next/image';
import { Recipe } from '@/types/database';
import { RECIPE_CATEGORIES } from '@/types/database';

interface RecipesListProps {
  recipes: Recipe[];
}

export default function RecipesList({ recipes }: RecipesListProps) {
  if (recipes.length === 0) {
    return (
      <div className="rounded-lg bg-white p-12 text-center shadow">
        <p className="text-gray-500">No recipes found. Be the first to share one!</p>
        <Link
          href="/recipes/new"
          className="mt-4 inline-block rounded-md bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700"
        >
          Create Recipe
        </Link>
      </div>
    );
  }

  return (
    <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      {recipes.map((recipe) => {
        const categoryLabel =
          RECIPE_CATEGORIES.find((c) => c.value === recipe.category)?.label ||
          recipe.category;

        return (
          <Link
            key={recipe.id}
            href={`/recipes/${recipe.id}`}
            className="group overflow-hidden rounded-lg bg-white shadow transition-shadow hover:shadow-lg"
          >
            {recipe.image_url ? (
              <div className="relative h-48 w-full">
                <Image
                  src={recipe.image_url}
                  alt={recipe.title}
                  fill
                  className="object-cover transition-transform group-hover:scale-105"
                />
              </div>
            ) : (
              <div className="flex h-48 w-full items-center justify-center bg-gray-100">
                <span className="text-4xl">🍳</span>
              </div>
            )}
            <div className="p-4">
              <div className="mb-2">
                <span className="inline-flex items-center rounded-full bg-indigo-100 px-2 py-1 text-xs font-medium text-indigo-800">
                  {categoryLabel}
                </span>
              </div>
              <h3 className="mb-2 text-lg font-semibold text-gray-900 group-hover:text-indigo-600">
                {recipe.title}
              </h3>
              <p className="text-sm text-gray-500">
                {recipe.ingredients.length} ingredient
                {recipe.ingredients.length !== 1 ? 's' : ''} • {recipe.steps.length}{' '}
                step{recipe.steps.length !== 1 ? 's' : ''}
              </p>
            </div>
          </Link>
        );
      })}
    </div>
  );
}

