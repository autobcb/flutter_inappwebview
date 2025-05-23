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

import { Any, StringUtils } from '@ohos/flutter_ohos';

export default class WebResourceResponseExt {
  private contentType: string;
  private contentEncoding: string;
  private statusCode: number
  private reasonPhrase: string;
  private headers: Map<string, string>;
  private data: ArrayBuffer;

  constructor(contentType: string, contentEncoding: string, statusCode: number, reasonPhrase: string, headers: Map<string, string>, data: ArrayBuffer) {
    this.contentType = contentType;
    this.contentEncoding = contentEncoding;
    this.statusCode = statusCode;
    this.reasonPhrase = reasonPhrase;
    this.headers = headers;
    this.data = data;
  }

  static fromWebResourceResponse(response: WebResourceResponse): WebResourceResponseExt {
    let headers = new Map<string, string>()
    for (let header of response.getResponseHeader()) {
      headers.set(header.headerKey, header.headerValue)
    }
    return new WebResourceResponseExt(response.getResponseMimeType(),
      response.getResponseEncoding(),
      response.getResponseCode(),
      response.getReasonMessage(),
      headers,
      StringUtils.stringToArrayBuffer(response.getResponseData())
    );
  }

  static fromMap(map: Map<string, Any>): WebResourceResponseExt | null {
    if (map == null) {
      return null;
    }
    let contentType: string = map.get("contentType");
    let contentEncoding: string = map.get("contentEncoding");
    let statusCode: number = map.get("statusCode");
    let reasonPhrase: string = map.get("reasonPhrase");
    let headers: Map<string, string> = map.get("headers");
    let data: ArrayBuffer = map.get("data");
    return new WebResourceResponseExt(contentType, contentEncoding, statusCode, reasonPhrase, headers, data);
  }

  toMap(): Map<string, Object> {
    let webResourceResponseMap: Map<string, Any> = new Map<string, Any>();
    webResourceResponseMap.set("contentType", this.contentType);
    webResourceResponseMap.set("contentEncoding", this.contentEncoding);
    webResourceResponseMap.set("statusCode", this.statusCode);
    webResourceResponseMap.set("reasonPhrase", this.reasonPhrase);
    webResourceResponseMap.set("headers", this.headers);
    webResourceResponseMap.set("data", this.data);
    return webResourceResponseMap;
  }


  getContentType(): string {
    return this.contentType;
  }

  setContentType(contentType: string) {
    this.contentType = contentType;
  }

  getContentEncoding(): string {
    return this.contentEncoding;
  }

  setContentEncoding(contentEncoding: string) {
    this.contentEncoding = contentEncoding;
  }

  getStatusCode(): number {
    return this.statusCode;
  }

  setStatusCode(statusCode: number) {
    this.statusCode = statusCode;
  }

  getReasonPhrase(): string {
    return this.reasonPhrase;
  }

  setReasonPhrase(reasonPhrase: string) {
    this.reasonPhrase = reasonPhrase;
  }

  getHeaders(): Map<string, string> {
    return this.headers;
  }

  setHeaders(headers: Map<string, string>) {
    this.headers = headers;
  }

  getData(): ArrayBuffer {
    return this.data;
  }

  setData(data: ArrayBuffer) {
    this.data = data;
  }

  getHeaderArray(): Array<Header> {
    let arrayHeaders = Array<Header>()
    this.headers.forEach((value: string, key: string) => {
      arrayHeaders.push({headerKey : key, headerValue: value})
    })
    return arrayHeaders;
  }

  public toString(): string {
    return "WebResourceResponseExt{" +
      "contentType='" + this.contentType + '\'' +
      ", contentEncoding='" + this.contentEncoding + '\'' +
      ", statusCode=" + this.statusCode +
      ", reasonPhrase='" + this.reasonPhrase + '\'' +
      ", headers=" + this.headers +
      ", data=" + this.data.toString() +
      '}';
  }
}