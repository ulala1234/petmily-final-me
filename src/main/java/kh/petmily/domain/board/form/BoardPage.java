package kh.petmily.domain.board.form;

import lombok.Data;

import java.util.List;

@Data
public class BoardPage {

    private int total;
    private int currentPage;
    private List<ReadBoardForm> title;
    private int totalPages;
    private int startPage;
    private int endPage;

    public BoardPage(int total, int currentPage, int size, List<ReadBoardForm> title) {
        this.total = total;
        this.currentPage = currentPage;
        this.title = title;

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

            if (modVal == 0) {
                startPage -= 5;
            }

            endPage = startPage + 4;

            if (endPage > totalPages) {
                endPage = totalPages;
            }
        }
    }

    public int getTotal() {
        return total;
    }

    public boolean hasNoBoard() {
        return total == 0;
    }

    public boolean hasBoard() {
        return total > 0;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public List<ReadBoardForm> getTitle() {
        return title;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }
}
