package com.alipay.config;

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
    public static String app_id = "2021000117625937";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRUe1w69qHyibJJw2f56s3vuh7p/GF1O2IZ/IkX+aNuR+bgTBa/z2HQ/xbHGq6x78Mb+vnOvsiSJop7UcPmvVQ5Jw1WHohfMyiSNkwCoeEWF+da8cnWk3FY0gGkoroY2CbL/NP/aCmPF3DJ7SHeNVqcN39F4/lAUwinLRJm0zQ8UJjguGj2X6EWF4EItfzYgo1L4RluqWy6Wy8Oq44wtzZuvjregzZTZdOm4t/1CFbf3ks4Ujpoysteg0bNE97ixXRXhshGdHbpCEF58bKVWxjS+1+WUCwttamxKna4Imc0BtNrMARn9WQWFaKF73FIvnhG/NEtI7h28Ph011wvyeFAgMBAAECggEBAJwnbWYvXUCt609m5gAjuRSGRDNzr3dyyJ1ZRkgijwGtWEoPD37jKQiPDGUABxM+TmU93ZQL6SvDU9bxX3Dh3h6x3WLilYID8zkh9XykbkKqFvJ+Y/0Uni4iCap1ilEhSgGbvP0wrbc2E5CyPzhNSZD1kHXuLPffhufPVaQPyjeYWdCGegEwjleWN1UtmB2RHe4U4BqmF2+yK9CgctB9B37G04bD9Zr++19k+oTFnhtbRVMHzzmdgQPQO3y/CNQu4kdLh941RNL0JB1f0zMp/6KvXdSrv0CWXmdwzxmueZfeDttx7s2/wPCrVa2bsy/YMeDrqWYORlHsS71TyHtzk2ECgYEA+gSghO5EVJbTVCTX3C8qAEaEGH52GnuxSpEZKKAC6BSH7ecgMMAh25bsN6E0J5iQl6YrKn0iEwPrXoHGWyShGJzrigPA7YCvx2pDw8PEyERbsx0Ff1Zn23Cl5IwTZB9OBslmDZ2SlMuKp9gzKxxDlaQqdj1Q15wY04GKfYoAFFkCgYEA1lQF4EeMK6kEgeyhNexlAmbVsnUlJcGUvgtLObL+gdKIvcaP4mBufKLDwRYXMVEntd73Pp0Ha0DAjKdQIbLzfCogyxHPsc9H3F9g1vKpUe+j7flpuf0vkIQAWz320x0SHgSFTzxErdyJlFId333sf8IzP1PkJVskhCL7gv13Nw0CgYEAgYgYKgbP/AtQXc3g0EDXP+FI2u/Z/IqNJhbatAOCvf61Ffqi4N8KK5ybsY6hWMpgT1FWF+NQ3g0vynzt6Zamp/vUxGKBeAsuBuD1Tt2EfEV+ROQKTxjTIgvQxwITodHeOQHrD67NnK1/nsoSaIlyMnslTLEjyzEiY6I/wB7ZP7ECgYAQrcE3TtoNm72KDswM0jSaFz6SAKO/aG0WzPIxr0g2+hdCDW2tBCwU7uWk5P8xC0u3z34WFUo6gnN5fpuxw6dHBlA+/UfYYnUJJTL4BzI9+hQbtMkRfC5zZJJSh2Pp0d1TEK7/F4WQshTSwgEpHzeESayLRRAACDOzRLWl3+ujEQKBgA0W1g1KBcMm6lx7LusiQ1L6QRub6OQuSNCyYiORYZvrlFYeczjZsqPFGDGBQgtvvJy4EK1awMmeAsqy3UztKSwbh5ko8z4cKvd7mz+Rp90fC8H+e+HEv1e2L/CSpvhFBTplqI0vwC0FsERg/0FpiaO674bCNVTrnZcVWuMUB04W";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg4Lpj7jb5xzgYFvOTAAlO4nB7s+0jJhnw50KNvnRSR1Pag3OihQlk2X2Fo6SYJxjmUqJnJUmZ03/Vy6GvbnFGeIJOw3mrtqDdUNYhneKg+JPuttwPWML7TMh6MefDQo4L74hVavi4Tyzm/NtTlolggteHyvNUYMo1Yk4kwlkkcxzJFQ2jkc/J1uIHA8tgk/MLeafztyg5wHMYwQeGuD8+MQstXMKgo9TPJIbxzMnrhpRjeGwvP0a/t2ULPZu111v17iCCRsf/sn3B1ANgEM8QhwwhKgT4Sb4AKIgL8LJLO5PafcpqG3NPpkrrNuRH1hBXcpzn4SqxhzcoWHYldq2PQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String notify_url = "http://localhost:8080/FpSystem/notify_url.jsp";
    public static String notify_url = "http://localhost:8080/FpSystem_war_exploded/pay/notify_url.do";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String return_url = "http://localhost:8080/FpSystem/return_url.jsp";
    public static String return_url = "http://localhost:8080/FpSystem_war_exploded/pay/return_url.do";

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
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
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

