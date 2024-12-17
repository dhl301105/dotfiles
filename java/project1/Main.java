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

  public static void main(String[] args) {
    URL url;
    InputStream is = null;
    BufferedReader br;
    String line;

    try {
      url = new URL("https://metruyencv.com/truyen/dau-pha-thuong-khung-1/chuong-1");
      is = url.openStream(); // throws an IOException
      br = new BufferedReader(new InputStreamReader(is));

      String html = "";

      while ((line = br.readLine()) != null) {
        html = html + line;
      }

      Document doc = Jsoup.parse(html);
      Elements links = doc.select("a");
      Element head = doc.select("div").first();
      System.out.println(head);

    } catch (MalformedURLException mue) {
      mue.printStackTrace();
    } catch (IOException ioe) {
      ioe.printStackTrace();
    } finally {
      try {
        if (is != null)
          is.close();
      } catch (IOException ioe) {
        // nothing to see here
      }
    }
  }

}
