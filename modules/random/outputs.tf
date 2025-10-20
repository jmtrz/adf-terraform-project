output "name" {
  description = "The name of the resource"
  value       = random_id.suffix.hex
}