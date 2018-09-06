package cn.lanqiao.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091800538337";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDasSSeiDSAJihzwbb4Gm6fe+lXlrUrN3Y9Ldt/xpa3uBeFyX44GlMh6qIdEtO5mGYeJDSY5AE3ph5k3XHgNHMkkm6+BDbe5yf7nf8myT8Xh11lAmq3Hj5zPLUcl2I5U6qCyTDIAUZoG4kAuz7B/iRBJaCv/Uott8Ykh9ssFPl3kVHGPQqq1ReIhkfkeO1jmh9oTrCT9dvsDpmcSt2/v7tXe9PjOWOsLq5hQtRSGcIkJco3gwpeDXHzDgg2hd9/hbNDGGbOti7MJ5jjHzcnGTyBQRAfohEGUKSgKH0yHkrCDIR315z4qPMNK6Bx2Aqfob47YDG2r2tVukzC0e7Ik1kLAgMBAAECggEAS0p/hAD6qj/431mLB8H54fiELn6ZYwaWM5vtHQGe9CNyHcJwLRqLEns4UvAfap9YUPpADX86GBGeFzXSNdF47tdnPw4uYfGNZ2hO5uiUSyJ0egkp+l90OrJk3DIWRAxVAPAJVmJx/fe05EaS5bD8hF1TBCQc/L5vfjYzs+qItKv1KUg59eII6d0HCb/Hnt8L0zOuhCeNphUUZfYEPhDdl9+yp/myAHa5FKLqiGs45E+6RJj2Cv/A+isELP27KudSzXe0Gi6yv4OJ1eMjeUkWvj3IAWUYbUXJ7zRjRfPepLeMBdZQ5czFSdO75cFahuifylt4fS/ZhYSiQ05CCE1EMQKBgQD5RsEGYsPxrpWCVEzMdVwoBei+nptEZEwu42/X81tU1k3AeHc7DHhiGo4cjrFfoZJb6UTETrMJuekUES94zA2/j4nEXE2/zXNfaPLDhWrPJRwYiiHOOtZOcBDgAojrALRwJM3Io0Tl4Wwt14vwv7E7mDDbcMVPgIKCPUG9DG9iSQKBgQDglzRdKjc3TXpDh3MJeJZ1EpiTAWn05perx5bdZ9qeS7+SMI+ORV3wvm3WXvyscimcho0HyD0ZxDZje/FRWhz4vcv/p9mTpsfQq1j4JeyOv1v7KtYHBRcoqvFzs3TfT9BQ5XdVMFmRFYsffNcWI5JDLe6qn4tLHm6VXcoibySgswKBgQC2FAZeIbo6SGmQnv7RwU+lNFvDEJsdI526Cgrh1DH8D+UPF28PxJYSIo93MItC7QO4+vRt54ZDLnafX8YrF/Fa4P+iXEG2Pd1t7XyVcFiKIfMZwZvbxYJQHO9WkMNt1D/4QgnF6ewjdbrM6UqgeYR9oTbessqMvbOWaiQgcHrTcQKBgAJK6NjunmOtIctgrZbyKS8GwpH1mLxMQk4ZmnumHMAy68C1SDHemWfkucBPderYu34CjZv/ukfyDdAUKtF2xwbvAQ8aComMUUvbA+x8jp6ia3Dz7f1iWusqW46fzVieOvUocoBnHvLxMlte7d8m+849wMrzF/vrUpupum+BjPErAoGBAI3vVu84KbUYeiEMPvaqfYJ2sOk1Bfswblvo/AwMve1FXNnFFi8rWVroS3AFlHSCmZBdAEJ+9oCoujJQNsSRD8PeDguDGs/ITEBlBLWFT6tCGVw0lSP+OZazUN/cLjvNGd9CenKRQXDnMRZjSK20YGllS1lP66mA7cOQ9Mp16o4F";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvxExZDD8tW1BQkUsoHsShG9g9crOXRuOGCRg9wDJ9cmOhTZ8tLdkyz1gF57fah7wvYmY0AAF68IOC7+I7Q1M/2e8cP3U/R2t+HombMwohLDR42P2WLviELixqTu0dME/AkUOMtiSO04C4OMBwHmMW1FK1rXQYGSb9lRSacah+wC5dUmCFY1cmSHgClPMZCH5EZt2XZbNuS/x0hYaC9jaDxtnyZXBKbhbcr0z8lfhHsGD+6moRYKqyhmHsbGoWpzXkkfwCHj9c9J/TuXnjXUN5DZcsKZSxleTIAVtu5Myx0elUUYvvgv9vjTAldV/MvCURiSNxNxCj6LCs9uuznDxIwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://www.yangjunsi.top/";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://www.yangjunsi.top/lanqiaoshop/clearcart.do";
			//"http://daoyan.s1.natapp.cc/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

