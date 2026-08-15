# আমার ছোট Flutter অ্যাপ

এটি `Keshab1997/flutter-builder` পরীক্ষা করার জন্য একটি ছোট বাংলা Flutter demo।

## Feature

- সুন্দর Material 3 UI
- Counter button
- নতুন task যোগ করা
- Task complete/remove করা
- Light/Dark theme
- দুইটি widget test
- GitHub Actions CI
- Manual APK/AAB build

## APK তৈরি

```text
Repository → Actions → Manual Android Build → Run workflow → apk
```

Build সফল হলে workflow page-এর নিচে `android-release-apk` artifact download করুন। ZIP extract করলে APK পাওয়া যাবে।

## AAB তৈরি

AAB-এর আগে builder repository-এর বাংলা signing guide অনুসরণ করে চারটি GitHub Secret যোগ করতে হবে। এরপর manual build থেকে `aab` নির্বাচন করুন।

## Builder

```yaml
uses: Keshab1997/flutter-builder/.github/workflows/flutter-build.yml@v1
```
