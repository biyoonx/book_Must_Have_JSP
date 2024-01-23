package board_mine;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostDTO {
    // board 테이블
    private long num;
    private String title;
    private String content;
    private String id;
    private Date postDate;
    private long visitCount;

    // member 테이블
    private String name;
}