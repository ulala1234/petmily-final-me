package kh.petmily.service;

import kh.petmily.domain.reply.form.ReadReplyForm;
import kh.petmily.domain.reply.form.ReplyModifyForm;
import kh.petmily.domain.reply.form.ReplyWriteForm;

import java.util.List;

public interface ReplyService {

    public void write(ReplyWriteForm replyWriteForm);

    public void modify(ReplyModifyForm replyModifyForm);

    public void delete(int brNumber);

    public List<ReadReplyForm> getList(int bNumber);

    public int selectCount(int bNumber);
}