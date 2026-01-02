import Link from 'next/link';
import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';

export default async function HomePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (user) {
    redirect('/recipes');
  }

  return (
    <div className="flex min-h-screen flex-col">
      <div className="flex flex-1 items-center justify-center bg-gradient-to-br from-indigo-50 to-white px-4 py-12 sm:px-6 lg:px-8">
        <div className="w-full max-w-4xl text-center">
          <h1 className="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">
            Share Your Favorite Recipes
          </h1>
          <p className="mx-auto mt-6 max-w-2xl text-lg leading-8 text-gray-600">
            Discover amazing recipes from our community or share your own culinary
            creations. Join thousands of home cooks sharing their best dishes.
          </p>
          <div className="mt-10 flex items-center justify-center gap-x-6">
            <Link
              href="/signup"
              className="rounded-md bg-indigo-600 px-6 py-3 text-base font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Get started
            </Link>
            <Link
              href="/recipes"
              className="text-base font-semibold leading-7 text-gray-900"
            >
              Browse recipes <span aria-hidden="true">→</span>
            </Link>
          </div>
        </div>
      </div>

      <div className="bg-white py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl lg:text-center">
            <h2 className="text-base font-semibold leading-7 text-indigo-600">
              Features
            </h2>
            <p className="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
              Everything you need to share recipes
            </p>
          </div>
          <div className="mx-auto mt-16 max-w-2xl sm:mt-20 lg:mt-24 lg:max-w-4xl">
            <dl className="grid max-w-xl grid-cols-1 gap-x-8 gap-y-10 lg:max-w-none lg:grid-cols-2 lg:gap-y-16">
              <div className="relative pl-16">
                <dt className="text-base font-semibold leading-7 text-gray-900">
                  <div className="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                    <span className="text-2xl">📝</span>
                  </div>
                  Easy Recipe Creation
                </dt>
                <dd className="mt-2 text-base leading-7 text-gray-600">
                  Upload your recipes with ingredients, step-by-step instructions, and
                  beautiful images.
                </dd>
              </div>
              <div className="relative pl-16">
                <dt className="text-base font-semibold leading-7 text-gray-900">
                  <div className="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                    <span className="text-2xl">🔍</span>
                  </div>
                  Search & Filter
                </dt>
                <dd className="mt-2 text-base leading-7 text-gray-600">
                  Find exactly what you're looking for with powerful search and category
                  filtering.
                </dd>
              </div>
              <div className="relative pl-16">
                <dt className="text-base font-semibold leading-7 text-gray-900">
                  <div className="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                    <span className="text-2xl">📱</span>
                  </div>
                  Mobile Friendly
                </dt>
                <dd className="mt-2 text-base leading-7 text-gray-600">
                  Access your recipes anywhere with our fully responsive design that works
                  on all devices.
                </dd>
              </div>
              <div className="relative pl-16">
                <dt className="text-base font-semibold leading-7 text-gray-900">
                  <div className="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                    <span className="text-2xl">👥</span>
                  </div>
                  Community Driven
                </dt>
                <dd className="mt-2 text-base leading-7 text-gray-600">
                  Share your recipes and discover new favorites from our growing community
                  of home cooks.
                </dd>
              </div>
            </dl>
          </div>
        </div>
      </div>
    </div>
  );
}
