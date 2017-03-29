package ChatClasses;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("ChatClasses/Login.java")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> users = new ArrayList<User>();
		users.add(new User("zeinab", "zeinab"));
		users.add(new User("zahra", "zahra"));
		users.add(new User("narges", "narges"));
		users.add(new User("ali", "ali"));
		users.add(new User("goli", "goli"));

		String username = request.getParameter("inputusername");
		String password = request.getParameter("inputpassword");
		String messag = "";

		for (User u : users) {
			if(u.username.matches(username)){
				if(u.password.matches(password)){
					HttpSession sesssion = request.getSession();
					sesssion.setAttribute("id", username);
					messag = "loggin successful";
					break;
				}else{
					messag = "password is not correct";
					break;
				}
			}
		}
		messag = "username not found";
		response.getWriter().append(messag);
		doGet(request, response);
	}

}
