@echo on

if "%1"=="" goto :USAGE

:MAIN
    pushd %~dp0
    rd storage.game.starlight-stage.jp\dl\%1\ /s /q
    md storage.game.starlight-stage.jp\dl\%1\High\AssetBundles\Android\manifest
    pushd storage.game.starlight-stage.jp\dl\%1\High\AssetBundles\Android\manifest
    rem manifest download.
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/3d_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/anime_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/atlas_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/banner_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/bg_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/campaign_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/card_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/cardsm_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/chara_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/comic_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/dailybonus_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/gachaselect_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/item_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/jacket_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/live_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/loginbonus_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/master_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/musicscores_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/room_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/skill_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/story_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/manifest/tutorial_assetmanifest -N
    "%~dp0\wget.exe" http://storage.game.starlight-stage.jp/dl/%1/High/Sound/Android/manifest/soundmanifest -N
    rem make filelist
    dir /b | "%~dp0each.bat" "%~dp0trim.vbs" ?
    copy 3d_assetmanifest_trim.txt + anime_assetmanifest_trim.txt  + atlas_assetmanifest_trim.txt  + banner_assetmanifest_trim.txt  + bg_assetmanifest_trim.txt  + campaign_assetmanifest_trim.txt  + card_assetmanifest_trim.txt  + cardsm_assetmanifest_trim.txt  + chara_assetmanifest_trim.txt  + comic_assetmanifest_trim.txt + dailybonus_assetmanifest_trim.txt + gachaselect_assetmanifest_trim.txt + item_assetmanifest_trim.txt + jacket_assetmanifest_trim.txt + live_assetmanifest_trim.txt + loginbonus_assetmanifest_trim.txt + master_assetmanifest_trim.txt + musicscores_assetmanifest_trim.txt + room_assetmanifest_trim.txt + skill_assetmanifest_trim.txt + story_assetmanifest_trim.txt + tutorial_assetmanifest_trim.txt filelist.txt /b
    rem make urllist
    for /f "delims=" %%l in (filelist.txt) do @echo http://storage.game.starlight-stage.jp/dl/%1/High/AssetBundles/Android/%%l >> urllist.txt
    for /f "delims=" %%l in (soundmanifest_trim.txt) do @echo http://storage.game.starlight-stage.jp/dl/%1/High/Sound/Android/%%l >> soundmanifest_urllist.txt
    rem start assets download.
    popd
    type storage.game.starlight-stage.jp\dl\%1\High\AssetBundles\Android\manifest\urllist.txt | each.bat wget.exe ? -x
    type storage.game.starlight-stage.jp\dl\%1\High\AssetBundles\Android\manifest\soundmanifest_urllist.txt | each.bat wget.exe ? -x
    goto :eof

:USAGE
    echo starlight_downloader.bat [RES_VER]
    echo more info: https://github.com/anzuwork/starlight_downloader
    pause
    goto :eof