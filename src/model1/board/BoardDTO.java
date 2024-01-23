package model1.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class BoardDTO {
    // board
    private long num;
    private String title;
    private String content;
    private String id;
    private Date postdate;
    private long visitcount;

    // member
    private String name;
}