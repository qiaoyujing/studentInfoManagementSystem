package swu.edu.cn.util;
/**
 * 分页工具类
 */
public class PageUtil {

	//当前页是第几页
	private int currentPage = 1; //����ȷ��
	//总页数
	private int totalNum = 0;	//���Բ鵽
	//前一页
	private int previousPage;	//���ݵ�ǰҳ����
	//后一页
	private int nextPage;		//���ݵ�ǰҳ����
	//5����ҳ
	private int firstPage = 1;
	//6��βҳ
	private int lastPage;		//�������������ҳ��С�����֪
	//7����ҳ��
	private int countPage;		//�������������ҳ��С�����֪
	//8����ҳ��С
	private int pageSize = 10;		//20
	//9��mysql  limit ��һ������������һ�п�ʼ��
	private int indexNum;
	//�����ҳ����ֵ
	public void calculation(){
		//��ҳ��
		countPage = (totalNum%pageSize)>0 ? (totalNum/pageSize)+1:(totalNum/pageSize);
		//��һҳ
		previousPage = currentPage>=2 ?(currentPage-1):1;
		//��һҳ
		nextPage = currentPage<countPage ? (currentPage+1):countPage;
		//mysql  limit ��һ������
		indexNum = (currentPage-1)*pageSize;
		//βҳ
		lastPage = countPage;
	}
	
	
	
	public int getCountPage() {
		return countPage;
	}



	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}



	public int getIndexNum() {
		return indexNum;
	}



	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}



	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getPreviousPage() {
		return previousPage;
	}
	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
