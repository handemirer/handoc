# Errors

## framework not found Pods_OneSignalNotificationServiceExtension

https://github.com/OneSignal/OneSignal-Flutter-SDK/issues/472#issuecomment-979504776
---

So i've manage to get through this:

Set both Excluded Architectures in Runner and OneSignalNotificationExtension with: arm64, i386

![ss](../img/error-1.png)
![ss](../img/error-2.png)

In Podfile add:

```
config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET' config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64 i386' config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
```

![ss](../img/error-3.png)