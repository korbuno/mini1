<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="data"  type="common.PageResult" %>
<%@ attribute name="url"  type="java.lang.String" %>

<c:if test="${not empty data.count and data.count!=0}">
	<nav>
		<ul class="pagination justify-content-center">
			<c:if test="${data.prev}">
				<li class="page-item">
					<a class="page-link" href="${url}?pageNo=${pageNo}&friendPageNo=${data.beginPage-1}&field=${param.field}&word=${param.word}" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${data.beginPage}" end="${data.endPage}">
				<c:choose>
					<c:when test="${data.pageNo==i}">
						<li class="active page-item">
							<a class="page-link" href="#${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" 
							href="${url}?pageNo=${pageNo}&friendPageNo=${i}&field=${param.field}&word=${param.word}">
								${i}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${data.next}">
				<li class="page-item">
					<a class="page-link" href="${url}?pageNo=${pageNo}&friendPageNo=${data.endPage+1}&field=${param.field}&word=${param.word}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
</c:if>