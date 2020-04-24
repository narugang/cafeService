package ant.tproject.cafeService.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import ant.tproject.cafeService.member.controller.MemberController;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor{
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		HttpServletRequest req = ssreq.getServletRequest();
		Integer memcode = (Integer.parseInt(MemberController.loginMemberCheck(req.getSession())));
		Integer roomcode = (Integer)req.getSession().getAttribute("roomcode");
		attributes.put("memcode", memcode);
		attributes.put("roomcode", roomcode);
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
