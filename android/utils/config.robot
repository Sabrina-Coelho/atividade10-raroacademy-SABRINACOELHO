*** Settings ***
Resource    ../base.robot

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}    Android
${ANDROID_PLATFORM_VERSION}    14
${ANDROID_UDID}    RQCW903B4KL
${AUTO_GRANT_PERMISSIONS}    true
${APP_FILEPATH}    C:\\Users\\Lucas\\Downloads\\product_registration\\product_registration.apk

*** Keywords ***
Abrir App
    Open Application    http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}    udid=${ANDROID_UDID}    autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}    app=${APP_FILEPATH}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications