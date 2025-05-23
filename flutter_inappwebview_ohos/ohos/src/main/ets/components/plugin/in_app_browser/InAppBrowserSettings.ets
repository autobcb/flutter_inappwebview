/*
* Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { Any } from '@ohos/flutter_ohos';
import ISettings from '../ISettings';
import InAppBrowserAbility from './InAppBrowserAbility';

const LOG_TAG = "InAppBrowserSettings"

export default class InAppBrowserSettings implements ISettings<InAppBrowserAbility> {

  public hidden: boolean = false
  public hideToolbarTop: boolean = false
  public toolbarTopBackgroundColor: string | null = null
  public toolbarTopFixedTitle: string | null = null
  public hideUrlBar: boolean = false
  public hideProgressBar: boolean = false

  public hideTitleBar: boolean = false
  public closeOnCannotGoBack: boolean = true
  public allowGoBackWithBackButton: boolean = true
  public shouldCloseOnBackButtonPressed: boolean = false
  public hideDefaultMenuItems: boolean = false

  constructor() {}

  public parse(settings: Map<string, Any>): InAppBrowserSettings {
    let keys = settings.keys()
    for(let key of keys) {
      if(settings[key] == null) {
        continue
      }

      switch (key) {
        case "hidden":
          this.hidden = settings[key] as boolean;
          break;
        case "hideToolbarTop":
          this.hideToolbarTop = settings[key] as boolean;
          break;
        case "toolbarTopBackgroundColor":
          this.toolbarTopBackgroundColor = settings[key] as string;
          break;
        case "toolbarTopFixedTitle":
          this.toolbarTopFixedTitle = settings[key] as string;
          break;
        case "hideUrlBar":
          this.hideUrlBar = settings[key] as boolean;
          break;
        case "hideTitleBar":
          this.hideTitleBar = settings[key] as boolean;
          break;
        case "closeOnCannotGoBack":
          this.closeOnCannotGoBack = settings[key] as boolean;
          break;
        case "hideProgressBar":
          this.hideProgressBar = settings[key] as boolean;
          break;
        case "allowGoBackWithBackButton":
          this.allowGoBackWithBackButton = settings[key] as boolean;
          break;
        case "shouldCloseOnBackButtonPressed":
          this.shouldCloseOnBackButtonPressed = settings[key] as boolean;
          break;
        case "hideDefaultMenuItems":
          this.hideDefaultMenuItems = settings[key] as boolean;
          break;
      }
    }

    return this
  }

  public toMap(): Map<string, Any> {
    let settings: Map<string, Any> = new Map<string, Any>()
    settings.set("hidden", this.hidden);
    settings.set("hideToolbarTop", this.hideToolbarTop);
    settings.set("toolbarTopBackgroundColor", this.toolbarTopBackgroundColor);
    settings.set("toolbarTopFixedTitle", this.toolbarTopFixedTitle);
    settings.set("hideUrlBar", this.hideUrlBar);
    settings.set("hideTitleBar", this.hideTitleBar);
    settings.set("closeOnCannotGoBack", this.closeOnCannotGoBack);
    settings.set("hideProgressBar", this.hideProgressBar);
    settings.set("allowGoBackWithBackButton", this.allowGoBackWithBackButton);
    settings.set("shouldCloseOnBackButtonPressed", this.shouldCloseOnBackButtonPressed);
    settings.set("hideDefaultMenuItems", this.hideDefaultMenuItems);
    return settings;
  }

  public getRealSettings(InAppBrowserAbility: InAppBrowserAbility): Map<string, Any> {
    let realSettings: Map<string, Any> = this.toMap()
    realSettings.set("hidden", InAppBrowserAbility.isHidden);
    // realSettings.set("hideToolbarTop", InAppBrowserAbility.actionBar == null || !InAppBrowserAbility.actionBar.isShowing());
    // realSettings.set("hideUrlBar", InAppBrowserAbility.menu == null || !InAppBrowserAbility.menu.findItem(R.id.menu_search).isVisible());
    // realSettings.set("hideProgressBar", InAppBrowserAbility.progressBar == null || InAppBrowserAbility.progressBar.getMax() == 0);
    return realSettings;
  }
}