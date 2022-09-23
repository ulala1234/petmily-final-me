package kh.petmily.domain.find_board.form;

import lombok.Data;

import java.util.List;

@Data
public class FindBoardPageForm {
    private int total;
    private int currentPage;
    private List<FindBoardListForm> content;
    private int totalPages;
    private int startPage;
    private int endPage;

    public FindBoardPageForm(int total, int currentPage, int size, List<FindBoardListForm> content) {
        this.total = total;
        this.currentPage = currentPage;
        this.content = content;

        if (total == 0) {
            totalPages = 0;
            startPage = 0;
            endPage = 0;
        } else {
            totalPages = total / size;

            if (total % size > 0) {
                totalPages++;
            }

            int modVal = currentPage % 5;
            startPage = currentPage / 5 * 5 + 1;

            if (modVal == 0) startPage -= 5;

            endPage = startPage + 4;

            if (endPage > totalPages) endPage = totalPages;
        }
    }
}