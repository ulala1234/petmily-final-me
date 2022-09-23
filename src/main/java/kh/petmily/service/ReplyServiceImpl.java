package kh.petmily.service;

import kh.petmily.dao.MemberDao;
import kh.petmily.dao.ReplyDao;
import kh.petmily.domain.reply.Reply;
import kh.petmily.domain.reply.form.ReadReplyForm;
import kh.petmily.domain.reply.form.ReplyModifyForm;
import kh.petmily.domain.reply.form.ReplyWriteForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class ReplyServiceImpl implements ReplyService {

    private final ReplyDao replyDao;
    private final MemberDao memberDao;

    @Override
    public void write(ReplyWriteForm replyWriteForm) {
        Reply reply = new Reply(replyWriteForm.getbNumber(), replyWriteForm.getmNumber(), replyWriteForm.getReply());
        replyDao.insert(reply);
    }

    @Override
    public void modify(ReplyModifyForm replyModifyForm) {
        Reply reply = new Reply(replyModifyForm.getBrNumber(), replyModifyForm.getReply());
        replyDao.update(reply);
    }

    @Override
    public void delete(int brNumber) {
        replyDao.delete(brNumber);
    }

    @Override
    public List<ReadReplyForm> getList(int bNumber) {
        List<ReadReplyForm> result = new ArrayList<>();
        List<Reply> replies = replyDao.list(bNumber);

        for (Reply reply : replies) {
            String writer = memberDao.selectName(reply.getMNumber());
            result.add(new ReadReplyForm(reply.getBrNumber(), reply.getMNumber(), reply.getReply(), reply.getWrTime(), writer));
        }

        return result;
    }
}