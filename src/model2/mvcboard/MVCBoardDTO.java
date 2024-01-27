package model2.mvcboard;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MVCBoardDTO {
    private long idx;
    private String name;
    private String title;
    private String content;
    private Date postdate;
    private String ofile;
    private String sfile;
    private long downcount;
    private String pass;
    private long visitcount;
}