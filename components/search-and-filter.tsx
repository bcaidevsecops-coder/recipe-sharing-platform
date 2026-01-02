'use client';

import { useRouter, useSearchParams } from 'next/navigation';
import { useState, useTransition } from 'react';
import { RECIPE_CATEGORIES, type RecipeCategory } from '@/types/database';

interface SearchAndFilterProps {
  initialSearch?: string;
  initialCategory?: string;
}

export default function SearchAndFilter({
  initialSearch = '',
  initialCategory = '',
}: SearchAndFilterProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [search, setSearch] = useState(initialSearch);
  const [category, setCategory] = useState<RecipeCategory | ''>(
    (initialCategory as RecipeCategory) || ''
  );
  const [isPending, startTransition] = useTransition();

  const handleSearch = (value: string) => {
    setSearch(value);
    const params = new URLSearchParams(searchParams.toString());
    if (value) {
      params.set('search', value);
    } else {
      params.delete('search');
    }
    if (category) {
      params.set('category', category);
    } else {
      params.delete('category');
    }
    startTransition(() => {
      router.push(`/recipes?${params.toString()}`);
    });
  };

  const handleCategoryChange = (value: RecipeCategory | '') => {
    setCategory(value);
    const params = new URLSearchParams(searchParams.toString());
    if (value) {
      params.set('category', value);
    } else {
      params.delete('category');
    }
    if (search) {
      params.set('search', search);
    } else {
      params.delete('search');
    }
    startTransition(() => {
      router.push(`/recipes?${params.toString()}`);
    });
  };

  return (
    <div className="mb-8 rounded-lg bg-white p-4 shadow">
      <div className="flex flex-col gap-4 sm:flex-row">
        <div className="flex-1">
          <label htmlFor="search" className="sr-only">
            Search recipes
          </label>
          <input
            type="text"
            id="search"
            value={search}
            onChange={(e) => handleSearch(e.target.value)}
            placeholder="Search recipes by title or ingredients..."
            className="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
          />
        </div>
        <div className="sm:w-48">
          <label htmlFor="category" className="sr-only">
            Filter by category
          </label>
          <select
            id="category"
            value={category}
            onChange={(e) =>
              handleCategoryChange((e.target.value || '') as RecipeCategory | '')
            }
            className="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
          >
            <option value="">All Categories</option>
            {RECIPE_CATEGORIES.map((cat) => (
              <option key={cat.value} value={cat.value}>
                {cat.label}
              </option>
            ))}
          </select>
        </div>
      </div>
      {isPending && (
        <p className="mt-2 text-sm text-gray-500">Searching...</p>
      )}
    </div>
  );
}

