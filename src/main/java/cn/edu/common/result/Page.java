package cn.edu.common.result;

import java.util.List;

public class Page {
    private Long count;
    private List list;
    private int curr;
    private int limit;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getCurr() {
        return curr;
    }

    public void setCurr(int curr) {
        this.curr = curr;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public Page(int curr, int limit) {
        this.curr = curr;
        this.limit = limit;
    }

    public Page() {
    }
}
