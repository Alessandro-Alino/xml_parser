import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDB {
  late final SupabaseClient _client;

  // Singleton privato
  SupabaseDB._();

  static SupabaseDB? _instance;

  /// Inizializza la singleton (da chiamare nel `main`)
  static Future<void> init() async {
    if (_instance == null) {
      final instance = SupabaseDB._();
      await instance._initialize();
      _instance = instance;
    }
  }

  Future<void> _initialize() async {
    const url = String.fromEnvironment('project_url');
    const anonKey = String.fromEnvironment('anon_public');

    assert(url.isNotEmpty, 'project_url mancante!');
    assert(anonKey.isNotEmpty, 'anon_public mancante!');

    await Supabase.initialize(url: url, anonKey: anonKey);
    _client = Supabase.instance.client;
  }

  /// Accesso sicuro alla singleton già inizializzata
  static SupabaseDB get instance {
    if (_instance == null) {
      init();
    }
    return _instance!;
  }

  SupabaseClient get client => _client;
}
