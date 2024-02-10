import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://uboklrrvwysdoztwfvuj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVib2tscnJ2d3lzZG96dHdmdnVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyOTI1MjEsImV4cCI6MjAyMjg2ODUyMX0.snO7gjARZRw677ToKsGYc49lgiHIU7HCaCw6M7rIXwY',
  );

  runApp(MyApp());
}

