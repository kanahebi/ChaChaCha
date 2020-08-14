import axios from 'axios';
import useSWR from 'swr';

const fetcher = (url: string) => axios.get(url).then((res) => res.data);

interface IuseUsers {
  departmentId: number
}
export const useUsers = ({ departmentId }: IuseUsers) => {
  const { data, error } = useSWR(`/api/users?department_id=${departmentId}`, fetcher);

  return {
    users: data as User[],
    isUserLoading: !error && !data,
  };
};
