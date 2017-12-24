package cn.edu.utils.treeview;

import java.util.ArrayList;
import java.util.List;


public class TreeView {
	public static List<Tree> tree(List<Tree>nodes, String id) {
		//递归转化为树形
		 List<Tree> treeNodes=new ArrayList<Tree>();
	        for(Tree treeNode : nodes) {
	        	Tree node=new Tree();
	            node.setId(treeNode.getId());
	            node.setText(treeNode.getText());
	            node.setIcon(treeNode.getIcon());
	            node.setIconClass(treeNode.getIconClass());
	            node.setPid(treeNode.getPid());
	            if(id.equals(treeNode.getPid())){
	                node.setChildren(tree(nodes, node.getId()));
	                treeNodes.add(node);
	            }
	        }
	        return treeNodes;
	}
}
