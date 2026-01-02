export interface Recipe {
  id: string;
  title: string;
  ingredients: string[];
  steps: string[];
  image_url: string | null;
  category: string;
  user_id: string;
  created_at: string;
  updated_at: string;
}

export interface RecipeInsert {
  title: string;
  ingredients: string[];
  steps: string[];
  image_url?: string | null;
  category: string;
  user_id: string;
}

export interface RecipeUpdate {
  title?: string;
  ingredients?: string[];
  steps?: string[];
  image_url?: string | null;
  category?: string;
}

export type RecipeCategory =
  | 'appetizers'
  | 'main-courses'
  | 'desserts'
  | 'beverages'
  | 'salads'
  | 'soups'
  | 'breakfast'
  | 'snacks'
  | 'other';

export const RECIPE_CATEGORIES: { value: RecipeCategory; label: string }[] = [
  { value: 'appetizers', label: 'Appetizers' },
  { value: 'main-courses', label: 'Main Courses' },
  { value: 'desserts', label: 'Desserts' },
  { value: 'beverages', label: 'Beverages' },
  { value: 'salads', label: 'Salads' },
  { value: 'soups', label: 'Soups' },
  { value: 'breakfast', label: 'Breakfast' },
  { value: 'snacks', label: 'Snacks' },
  { value: 'other', label: 'Other' },
];

export interface Profile {
  id: string;
  username: string | null;
  full_name: string | null;
  avatar_url: string | null;
  bio: string | null;
  website: string | null;
  created_at: string;
  updated_at: string;
}

export interface ProfileUpdate {
  username?: string | null;
  full_name?: string | null;
  avatar_url?: string | null;
  bio?: string | null;
  website?: string | null;
}

