package org.example.vo;

/**
 * Todo class representing a task with a title and description.
 */
public class Todo {
    private String title;
    private String description;
    private boolean completed;
    private String dueDate;
    private String priority;
    private String id;
    private String createdAt;
    private String updatedAt;
    private String userId;
    private String projectId;
    private String tags;
    private String status;
    private String assigneeId;
    private String createdBy;
    private String updatedBy;
    private String[] attachments;
    private String[] comments;
    private String[] subtasks;
    private String[] labels;

    public Todo() {
        // Default constructor
    }


    // Constructor with required fields
    public Todo(String title, String description, boolean completed, String dueDate, String priority,
                String id, String createdAt, String updatedAt) {
        this.title = title;
        this.description = description;
        this.completed = completed;
        this.dueDate = dueDate;
        this.priority = priority;
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Constructor with all fields
    public Todo(String title, String description, boolean completed, String dueDate, String priority,
                String id, String createdAt, String updatedAt, String userId, String projectId,
                String tags, String status, String assigneeId, String createdBy, String updatedBy,
                String[] attachments, String[] comments, String[] subtasks, String[] labels) {
        this.title = title;
        this.description = description;
        this.completed = completed;
        this.dueDate = dueDate;
        this.priority = priority;
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.userId = userId;
        this.projectId = projectId;
        this.tags = tags;
        this.status = status;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public boolean isCompleted() {
        return completed;
    }
    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
    public String getDueDate() {
        return dueDate;
    }
    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
    public String getPriority() {
        return priority;
    }
    public void setPriority(String priority) {
        this.priority = priority;
    }
    public String getId() {
        return id;
 
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    public String getUpdatedAt() {
        return updatedAt;
    }
    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getProjectId() {
        return projectId;
    }
    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }
    public String getTags() {
        return tags;
    }
    public void setTags(String tags) {
        this.tags = tags;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getAssigneeId() {
        return assigneeId;
    }
    public void setAssigneeId(String assigneeId) {
        this.assigneeId = assigneeId;
    }
    public String getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    public String getUpdatedBy() {
        return updatedBy;
    }
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
    public String[] getAttachments() {
        return attachments;
    }
    public void setAttachments(String[] attachments) {
        this.attachments = attachments;
    }
    public String[] getComments() {
        return comments;
    }
    public void setComments(String[] comments) {
        this.comments = comments;
    }

    public String[] getSubtasks() {
        return subtasks;
    }
    public void setSubtasks(String[] subtasks) {
        this.subtasks = subtasks;
    }
    public String[] getLabels() {
        return labels;
    }
    public void setLabels(String[] labels) {
        this.labels = labels;
    }
    @Override
    public String toString() {
        return "Todo{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", completed=" + completed +
                ", dueDate='" + dueDate + '\'' +
                ", priority='" + priority + '\'' +
                ", id='" + id + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", tags='" + tags + '\'' +
                ", status='" + status + '\'' + "}";
    }
    




}
