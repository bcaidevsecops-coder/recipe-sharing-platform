import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';
import RecipeForm from '@/components/recipe-form';

export default async function NewRecipePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect('/login');
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-3xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Create New Recipe</h1>
          <p className="mt-2 text-gray-600">
            Share your favorite recipe with the community
          </p>
        </div>

        <RecipeForm />
      </div>
    </div>
  );
}

