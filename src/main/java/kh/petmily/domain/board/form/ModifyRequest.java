package kh.petmily.domain.board.form;

import java.util.Map;

public class ModifyRequest {

    private int bNumber;
    private int mNumber;
    private String title;
    private String content;
    private String checkPublic;

    public ModifyRequest(int bNumber, int mNumber, String title, String content, String checkPublic) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }

    public int getbNumber() {
        return bNumber;
    }

    public int getmNumber() {
        return mNumber;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getCheckPublic() {
        return checkPublic;
    }

    public void validate(Map<String, Boolean> errors) {
        if (title == null || title.trim().isEmpty()) {
            errors.put("title", Boolean.TRUE);
        }
    }

}
