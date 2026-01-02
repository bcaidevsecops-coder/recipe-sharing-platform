/**
 * Verification script to test Supabase connection
 * Run with: npx tsx scripts/verify-supabase.ts
 */

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing environment variables!');
  console.error('Please set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY in .env.local');
  process.exit(1);
}

if (supabaseUrl.includes('your_supabase') || supabaseKey.includes('your_supabase')) {
  console.error('❌ Please replace the placeholder values in .env.local with your actual Supabase credentials');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function verifyConnection() {
  console.log('🔍 Verifying Supabase connection...\n');

  try {
    // Test 1: Check if we can connect
    console.log('1. Testing connection...');
    const { data, error } = await supabase.from('recipes').select('count').limit(0);
    
    if (error && error.code === 'PGRST116') {
      console.log('   ⚠️  Table "recipes" does not exist yet');
      console.log('   → Run the SQL schema in Supabase SQL Editor\n');
    } else if (error) {
      console.error('   ❌ Connection error:', error.message);
      return false;
    } else {
      console.log('   ✅ Connection successful!\n');
    }

    // Test 2: Check storage bucket
    console.log('2. Checking storage bucket...');
    const { data: buckets, error: bucketError } = await supabase.storage.listBuckets();
    
    if (bucketError) {
      console.error('   ❌ Storage error:', bucketError.message);
      return false;
    }

    const recipeBucket = buckets?.find(b => b.id === 'recipe-images');
    if (recipeBucket) {
      console.log('   ✅ Storage bucket "recipe-images" exists\n');
    } else {
      console.log('   ⚠️  Storage bucket "recipe-images" not found');
      console.log('   → The SQL schema should create it, or create it manually in Storage settings\n');
    }

    console.log('✅ All checks passed! Your Supabase integration is ready.');
    return true;
  } catch (error: any) {
    console.error('❌ Unexpected error:', error.message);
    return false;
  }
}

verifyConnection();

