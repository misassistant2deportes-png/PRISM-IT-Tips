-- Create the tips table
CREATE TABLE IF NOT EXISTS public.tips (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  cat text NOT NULL,
  steps text NOT NULL,
  sort_index integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.tips ENABLE ROW LEVEL SECURITY;

-- Create policies for public access (read/write for everyone)
-- Option 1: Public access (anyone can read/write)
CREATE POLICY "Allow public read access" ON public.tips
  FOR SELECT USING (true);

CREATE POLICY "Allow public insert access" ON public.tips
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public update access" ON public.tips
  FOR UPDATE USING (true);

CREATE POLICY "Allow public delete access" ON public.tips
  FOR DELETE USING (true);

-- Optional: If you want to disable RLS entirely (less secure but simpler)
-- ALTER TABLE public.tips DISABLE ROW LEVEL SECURITY;
