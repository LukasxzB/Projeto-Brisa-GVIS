enum AppSharedStorageKey {
  loginToken('session_token'),
  selectedServer('selected_server'),
  username('username'),
  email('email'),
  lastSyncTime('last_sync_time');

  final String sharedKey;
  const AppSharedStorageKey(this.sharedKey);
}
