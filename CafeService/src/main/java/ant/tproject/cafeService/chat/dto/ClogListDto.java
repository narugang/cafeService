package ant.tproject.cafeService.chat.dto;

public class ClogListDto {
   private Integer code;
   private String nic;
   private Integer sendmem;
   private String sendda;
   private String contxt;
   private String fileadd;
   private String recda;
   
   public ClogListDto() {}
   public ClogListDto(Integer code, String nic, Integer sendmem, String sendda, String contxt, String fileadd, String recda) {
      this.code = code;
      this.nic = nic;
      this.sendmem = sendmem;
      this.sendda = sendda;
      this.contxt = contxt;
      this.fileadd = fileadd;
      this.recda = recda;
   }
   
   public String getRecda() {
      return recda;
   }
   public void setRecda(String recda) {
      this.recda = recda;
   }
   public String getNic() {
      return nic;
   }
   public void setNic(String nic) {
      this.nic = nic;
   }
   public Integer getCode() {
      return code;
   }
   public void setCode(Integer code) {
      this.code = code;
   }
   public Integer getSendmem() {
      return sendmem;
   }
   public void setSendmem(Integer sendmem) {
      this.sendmem = sendmem;
   }
   public String getSendda() {
      return sendda;
   }
   public void setSendda(String sendda) {
      this.sendda = sendda;
   }
   public String getContxt() {
      return contxt;
   }
   public void setContxt(String contxt) {
      this.contxt = contxt;
   }
   public String getFileadd() {
      return fileadd;
   }
   public void setFileadd(String fileadd) {
      this.fileadd = fileadd;
   }
}