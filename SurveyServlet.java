import com.example.SurveyDao;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SurveyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자로부터 선택된 과일 가져오기
        String chosenFruit = request.getParameter("fruit");

        // SurveyDao 사용하여 DB에서 투표 수 가져오기
        SurveyDao dao = new SurveyDao();
        int appleVotes = dao.getVotes("Apple");
        int grapeVotes = dao.getVotes("Grape");
        int strawberryVotes = dao.getVotes("Strawberry");
        int melonVotes = dao.getVotes("Melon");

        // 전체 투표 수 계산
        int totalVotes = appleVotes + grapeVotes + strawberryVotes + melonVotes;

        // 퍼센트 계산
        double applePercentage = totalVotes > 0 ? (double) appleVotes / totalVotes * 100 : 0;
        double grapePercentage = totalVotes > 0 ? (double) grapeVotes / totalVotes * 100 : 0;
        double strawberryPercentage = totalVotes > 0 ? (double) strawberryVotes / totalVotes * 100 : 0;
        double melonPercentage = totalVotes > 0 ? (double) melonVotes / totalVotes * 100 : 0;

        // 결과를 request에 저장하여 JSP로 전달
        request.setAttribute("chosenFruit", chosenFruit);
        request.setAttribute("applePercentage", applePercentage);
        request.setAttribute("grapePercentage", grapePercentage);
        request.setAttribute("strawberryPercentage", strawberryPercentage);
        request.setAttribute("melonPercentage", melonPercentage);
        request.setAttribute("totalVotes", totalVotes);

        // JSP 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/outcome.jsp");
        dispatcher.forward(request, response);
    }
}
