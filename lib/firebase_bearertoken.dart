
import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? token;

  // to generate token only once for an app run
  static Future<String?> get getToken async => token ?? await getAccessToken();

  // to get admin bearer token
  static Future<String?> getAccessToken() async {
    try {
      const fMessagingScope = 'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-mssagedemo",
          "private_key_id": "0baef8c42fddf0ed96340fee3a68c4ba53cf78cc",
          "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCuOuF9UEal8toY\n9Aag/W5RGtG6K+x10zLbmMDZh6SlrT4zr+e7yZVZ9qJT1mxQdddeviH2NSA3GuUw\ndoLspXJ2DWG3Vx8ZPJE00M5zV2Nzmxyx7dUhnOwedZFswxob1rdrRxJDgEjVhucg\nLWT9AV12Kru1+FdxP4NBcllyZEh+FCJpIy6w17/cUF79TIaL5d60lOWo5KYEWFze\n2O5HGNK1WP0YKr8rkq6jib+iKqOVOKvXlbMz5uP1cKY0LOq9y0BYzjCoRigypiri\nYpnsJaVAqk2n5D64co+pnog11aiifS6p/yYpVuQIHyAEzXACBq+IHmMWyl6KR/wG\nnJ2b28llAgMBAAECggEAEW9ie74SB87E3Pzkge1Cghq/NJRrKgJLw1ZmrA4LH6o1\nwInglHXwfGt2JJIfTjDwr7Iyp1b7JZCLMV2WrfRDf0VJC0YMXmPlewXPNxMeaGX0\nCektLBsuNMEan6npfbIvsixPS1J112pTzDBGvBvMHMRbevMCWxqaOa0l/tDCwVz7\nni5ONPdLMjcErGR/z6AcLaLLRbj3DDU+N//qOAw7RKJOagk/Sp8cm9aa28MpM/qT\nf0FJ/sjT4+/v/kB8jxiklDzi/GfnLiLx/0pIgwOKojVwDlMCtLQT1v/Q7WULfGhb\nJUHv8g9e0i0Gnu6ZAZAQqHRMoVywKPD1XDvamsjb+QKBgQDecVwGeC47ZsgjKd5S\nxIktfw091Ti95kHdUOkHDzU5NVmgnVY9QAk03ZSN764wGHnM5B5j/02V8TcTkWmv\n0rpIY9wSc1bKzt/zZly6sxDtdf5sxLqE7mTAeF2TDgIiHTZ+8+tDqDRA+EEgGLk1\nAe3YW4HJKYAcxkstnH9kVB/zyQKBgQDIg5CIRABzjASBXrCuKuJnYnrElchGQ0HW\n6iRRgvR1x1SpAQGFd7R7qJ1jLdNajGC9SkSuZhKWvN3BglrRxlYfJIVRuyaYfyR9\nhfJDw9j6qwVp+iRi9S+kHU+FPoutQ7as1nash3dT3koJVMqGgccS0ZWP3AE2UEYk\nFCGzFTlevQKBgQDHnRyC5bg/MBXrkDflOF8Nh9UfJsdbilSSwXfMEPanFtwOSQLJ\nxjw8x5b25B4BJQWwOwmWnNVH+AV/tt8Lm+P08D/eAsjhCFJp/vK5y9Ul8tvVSZlD\njxa0rY7zVv/NE0ADHuqBdWEm6GCw597T1Z5VqJBIL8i6iauPC8A6DU/7GQKBgG9Q\nCkZ7aby7eCzRgkfN6s31761+cSYAZGaIqQzPJCLWO3tu4YdUgs87NdQ/NlvIHlQ3\nDJW8eIlR49FvKjfWYSz8uz46JRz3SCye1XUlHilaE7FXeietcXssAl8375aKRrkA\nffUdZvMaLgOsHJo7JWafDuZD/jBGtAmHW4XtPGIJAoGBAMB+BG6OqwgqezQW57N7\nsdBSTIHrcdJ+ywudp2fcWSz6BGbT7J+7FUazdjQyCuvvhQbLZb0tVCrv4NjlyIKM\nD6RLSr65L5kdiFyBs1QVwU2neffteuj/H5BmKh7Am4r7IUn+3cjNhoGxTGi+5aF5\n15QJbij3ETkLjkXHY8bMBUMA\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-m5h69@fir-mssagedemo.iam.gserviceaccount.com",
          "client_id": "108392812501497254854",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-m5h69%40fir-mssagedemo.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }
        ),
        [fMessagingScope],
      );

      token = client.credentials.accessToken.data;

      return token;
    } catch (e) {
      print('catch error *** $e');
      return null;
    }
  }
}