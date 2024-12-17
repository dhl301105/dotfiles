
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * Main
 */
public class Main {

    public static void main(String[] args) throws IOException {

        String html = Jsoup.connect("https://metruyencv.com/truyen/dau-pha-thuong-khung-1/chuong-1").get().html();

        Document doc = Jsoup.parse(html);
        Elements links = doc.select("a");
        Element head = doc.select("div.break-words").first().text;
        System.out.println(head);

    }

}
