package fileupload;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyFileDTO {
    private long idx;
    private String title;
    private String category;
    private String ofile;
    private String sfile;
    private Date postdate;
}