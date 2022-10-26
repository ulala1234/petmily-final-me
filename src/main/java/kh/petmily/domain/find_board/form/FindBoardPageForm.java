/*마이페이지 - 찾아요 게시판 페이징 처리를 위한 클래스이다.
찾아요 게시판의 게시글 데이터와 페이징 관련 정보를 담고 있다.*/
package kh.petmily.domain.find_board.form;

import lombok.Data;

import java.util.List;

@Data
public class FindBoardPageForm {
    /*필드*/
    // 전체 글의 행의 수
    private int total;
    // 현재 페이지 번호
    private int currentPage;
    // 찾아요 게시판 게시글 데이터
    private List<FindBoardListForm> content;
    // 전체 페이지 개수
    private int totalPages;
    // 시작 페이지 번호
    private int startPage;
    // 종료 페이지 번호
    private int endPage;

    /*생성자*/
    // size 매개변수: 한 화면에 보여질 행의 수
    public FindBoardPageForm(int total, int currentPage, int size, List<FindBoardListForm> content) {
        this.total = total;
        this.currentPage = currentPage;
        this.content = content;

        // 글이 없다면
        if (total == 0) {
            totalPages = 0;
            startPage = 0;
            endPage = 0;
            // 글이 있다면
        } else {
            // 전체 글의 행의 수 / 한 화면에 보여질 행의 수의 몫이 전체 페이지 개수지만
            totalPages = total / size;

            // 만약 나머지가 있다면 전체 페이지 개수를 1 증가시킨다.
            if (total % size > 0) {
                totalPages++;
            }

            // 여기서 5는 페이징 개수를 뜻한다.
            // 화면에 '이전 [1] [2] [3] [4] [5] 다음' 처럼 보인다.
            // 위의 예시로 [1]은 startPage, [5]는 endPage 를 뜻한다.
            int modVal = currentPage % 5;
            startPage = currentPage / 5 * 5 + 1;

            // 예를 들어, currentPage 가 5면 startPage 가 1이 아니라 6이니 -5를 해준다.
            if (modVal == 0) startPage -= 5;

            endPage = startPage + 4;

            // endPage 가 5인데 totalPage 가 그보다 작으면 totalPage 까지만 화면에 보이게 한다.
            if (endPage > totalPages) endPage = totalPages;
        }
    }
}